_ = window._

class Cheetah extends window.Mammal
    initialize: ()->
        Mammal::initialize.apply @, arguments
        @_log "I am a fast motherfucking cheetah, yo"
        return @

    defaults: ()->
        return {
            type: 'cheetah'
            legs: 4
        }

    hasSpots: ()->
        return true

    mate: (anotherThing)=>
        self = @
        self._log "I am mating with ", anotherThing
        if anotherThing instanceof Cheetah
            self._log "I can mate with this!"
        else
            self._log "I can't mate with that, yo!"
        return self

window.Cheetah = Cheetah