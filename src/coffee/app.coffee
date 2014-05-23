_ = require 'lodash'
express = require 'express.io'
http = require 'http'
prettyHTML = require('js-beautify').html
stylus = require 'stylus'
fs = require 'fs'
path = require 'path'
markdown = require('markdown').markdown
useragent = require 'express-useragent'
promise = require 'promised-io/promise'
Deferred = promise.Deferred
cheerio = require 'cheerio'
slug = require 'slug'

process.on "uncaughtException", (finalError)->
    if !_.isNull finalError
        console.warn "MEGA ERROR", finalError.stack, finalError.msg
        throw finalError

currentDirectory = process.cwd()

config = {
    title: 'HTML-APP'
    env: "development"
    port: process.env.PORT or 4567
    # The relevant directories
    directories: {
        root: currentDirectory
        # all directories get prepended with directories.root @ runtime
        public: '/build/public'
        build: '/build'
        docs: '/build/public/docs'
        views: '/views'
        vendor: '/vendor'
        assets: '/assets'
    }
    constants: { 
        SECRET : 'hjs9H45KJHDSILdlkjJhfDgo4ihJ497o9IhuGswlkjhdfglkhudf'
        KEY : '84IUSIOlighlsSFRYDkd3Sjd9Dg84li86DuDxil'
        COOKIE_LIFETIME : 1800000 # ms: 1 min = 60000
    }
}

directories = {}

root = config.directories.root
views = config.directories.views
directories.views = root + '' + views
directories.vendor = root + '' + config.directories.vendor
directories.public = root + '' + config.directories.public
directories.assets = root + '' + config.directories.assets

app = express().http().io()

app.set 'env', config.env
app.set 'views', directories.views
app.set 'view engine', 'jade'

# makes useragent data available in requests
app.use useragent.express()

# serve our directories.public as a static directory
app.use express.static directories.public

# default middleware
app.use express.cookieParser()
app.use express.json()
app.use express.urlencoded()

# session data
app.use express.session {
    cookie: {
        maxAge: config.constants.COOKIE_LIFETIME
    }
    secret: config.constants.SECRET
    key: config.constants.KEY
}

show404 = (req, res, err)->
    if err
        console.log req.method, req.url, err
    res.render '404', {url: req.url}, (err, html)->
        if err
            res.send 500, err
            return
        res.send html
        return

app.use app.router

app.use (req, res, next)->
    show404(req, res)

app.use (err, req, res, next)->
    if err
        console.log "final error stack!", err.stack
        res.send 500, "The machine is sick."

app.locals {
    title: config.title
}

writeAStaticPage = (url, view, stuff=false, outputLocation=false)->
    app.get url, (req, res)->
        options = {
            layout: false
        }
        if _.isObject stuff
            _(stuff).keys().each (key)->
                options[key] = stuff[key]
        res.render view, options, (err, html)->
            if err
                show404 req, res, err
                return
            if outputLocation
                phil.write outputLocation, prettyHTML(html), ()->
                    console.log "Wrote static HTML content to #{outputLocation}."
                    res.send html
            return

makeAnEndpoint = (url, view, stuff=false)->
    app.get url, (req, res)->
        options = {
            layout: false
        }
        displayFailures = false
        if _.isObject stuff
            _(stuff).keys().each (key)->
                if key is 'showfail'
                    displayFailures = true
                else
                    options[key] = stuff[key]
        res.render view, options, (err, html)->
            if err
                if !displayFailures
                    show404 req, res, err
                else
                    console.log err, "Error during page render."
                    throw err
                return
            res.send html
            return

htmlEndpoint = (url, view)->
    app.get url, (req, res)->
        fs.readFile view, 'utf8', (err, html)->
            if err
                console.log err
                throw err
            res.send html
            return
        return

markdownEndpoint = (url, file, transformFunction)->
    # if we don't get a tranformFunction, make a simple pass-through
    unless transformFunction?
        transformFunction = (html, cb)->
            return cb html
    app.get url, (req, res)->
        fs.readFile file, 'utf8', (err, html)->
            if err
                console.log err
                throw err
            transformFunction markdown.toHTML(html), (transformed)->
                res.send transformed
            return
        return
    return

lowerSlug = (x)->
    if _.isString x
        text = slug(x).toLowerCase()
        parts = text.split('-')
        if parts.length > 5
            parts = parts.slice 0, 5
            text = parts.join('-')
        return text

makeAnEndpoint '/', 'index'

console.log "Running a server on localhost:#{config.port}"
app.listen config.port
module.exports = app