_ = window._

class Insect extends window.Animal
    initialize: ()->
        Animal::initialize.apply @, arguments
        @_log "I am a Insect, yo"
        # Backbone.Model.apply @, arguments 
        return @

    defaults: ()->
        return {
            type: 'insect'
            legs: 6
        }

    hasFur: ()->
        return false

    hasExoSkeleton: ()->
        return true

window.Insect = Insect