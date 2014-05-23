_ = window._

class Mammal extends window.Animal
    initialize: ()->
        Animal::initialize.apply @, arguments
        @_log "I am a mammal, yo"
        # Backbone.Model.apply @, arguments 
        return @

    defaults: ()->
        return {
            type: 'mammal'
            legs: 4
        }

    hasFur: ()->
        return true

window.Mammal = Mammal