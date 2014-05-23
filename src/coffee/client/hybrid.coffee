_ = window._

class CrazyAssHybrid extends window.Mammal
    initialize: ()->
        Mammal::initialize.apply @, arguments
        Insect::initialize.apply @, arguments
        @_log "I am a fast motherfucking CrazyAssHybrid, yo"
        return @

    defaults: ()->
        return {
            type: 'hybrid'
            legs: Math.round Math.random() * 6
        }

    mate: (anotherThing)=>
        self = @
        self._log "I am mating with ", anotherThing
        self._log "I can mate with anything!"
        return self

window.CrazyAssHybrid = CrazyAssHybrid