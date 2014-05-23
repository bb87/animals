_ = window._

class Animal extends Backbone.Model
    initialize: ()->

        # Backbone.Model.apply @, arguments
        @set 'id', _.uniqueId @get('type')+'-'
        return @

    defaults: ()->
        return {
            type: 'animal'
            lifetime: 1000

        }

    _log: ()=>
        id = @get 'id'
        console.log.apply console, [id].concat _.toArray arguments

    eat: ()=>
        self = @
        self._log "I am eating"
        return self
    
    shit: ()=>
        self = @
        self._log "I am shitting"
        return self
    
    mate: (anotherThing)=>
        self = @
        self._log "I am mating with ", anotherThing
        if anotherThing instanceof Animal
            self._log "I can mate with this!"
        return self
    
    move: ()=>
        self = @
        self._log "I am moving"
        return self
    
    die: ()=>
        self = @
        self._log "I am dying"
        return self

window.Animal = Animal
