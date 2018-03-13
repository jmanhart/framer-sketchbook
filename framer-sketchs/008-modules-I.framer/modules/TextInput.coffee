

class TextInput extends Layer
    constructor: (options) ->
        super _.defaults options,
          x: Align.center()
          y: Align.bottom()
          width: Screen.width
          height: 60
          backgroundColor: 'green'


    setupLayer: (Layer) ->
      layer.parent = this
      layer.height = 30
      layer.width = 40
      layer.backgroundColor = 'pink'




    # dude = new subLayer
      # height: 100
      # width: 100
      # backgroundColor: 'pink'

exports.TextInput = TextInput
