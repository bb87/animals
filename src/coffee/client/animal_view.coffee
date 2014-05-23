_ = window._

class AnimalView extends Backbone.View
    initialize: ()->
        return @

    render: ()=>
        type = @model.get 'type'
        @$el.text "I am a " + type
        return @

window.AnimalView = AnimalView