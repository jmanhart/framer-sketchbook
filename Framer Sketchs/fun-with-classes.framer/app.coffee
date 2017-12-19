

spacer = 20



class textInput extends Layer
	constructor: (options) ->
		super _.defaults options,
			x: Align.center()
			y: Align.center()
			width: Screen.width - (spacer*2)
			height: 60
			borderWidth: 2
			borderColor: 'white'
			backgroundColor: null
			html: "sample string"
			style:
				"font-size":"0.75em"
				"display":"flex"
				"align-items":"center"
				"justify-content":"flex-start"
				"padding":"0em 1em"
 
 
button = new textInput

button = new textInput


