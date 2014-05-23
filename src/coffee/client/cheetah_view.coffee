_ = window._

class CheetahView extends Backbone.View
    initialize: ()->
        return @

    render: ()=>
        type = @model.get 'type'
        @$el.text "I am a " + type
        @$el.css {
            backgroundColor: '#fc0'
        }
        return @

window.CheetahView = CheetahView