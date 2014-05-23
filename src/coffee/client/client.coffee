$(document).ready ()->
    animal = new Cheetah()
    animalView = new CheetahView {
        model: animal
    }
    window.animalView = animalView
    $('#animals').append animalView.render().el