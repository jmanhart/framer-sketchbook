# Document Setup
bkgLayer = new BackgroundLayer
	backgroundColor: '#f8f8f8'
	


class Button extends Layer
	
	constructor: (@options={}) ->

#------ Default properties ------------------------------------------------

		@options.height = 48
		@options.width = Screen.width
		@options.backgroundColor = 'black'
		
		_.defaults @options,
			backgroundColor:""
			height: 100
			width: 200
			name: "Button"
		
#------ Background -------------------------------------------------------

		@BG = new Layer
			width: @options.width
			height: @options.height
			backgroundColor: @options.backgroundColor
			name: "BG"
			borderRadius: 10
			clip: true

#------ Background -------------------------------------------------------

# 		@bttnBG = new Layer
# 			width: @options.width
# 			height: @options.height
# 			clip: true
		
#------ Super ------------------------------------------------------------
		
		super @options
		
		@BG.parent = @











butt = new Button
	x: Align.center()
	y: Align.center()
