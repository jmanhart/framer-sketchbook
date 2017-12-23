bkg = new BackgroundLayer
	backgroundColor: '#E1E1E1'


class cardWrapper extends Layer
	constructor: (options) ->
		super _.defaults options,
			width: Screen.width * 0.90
			height: 250
			backgroundColor: 'white'
			shadowY: 2
			shadowBlur: 10
			borderRadius: 8
			
class inerSquare extends Layer
	constructor: (options) ->
		super _.defaults options,
			width: 10
			height: 45
			x: Align.center()
			y: Align.center()
			backgroundColor: 'green'
			
class label extends TextLayer
	constructor: (options) ->
		super _.defaults options,
			x: Align.center()
			y: Align.center()
			width: parent.width
			fontSize: 22
			backgroundColor: 'red'

	

				
				
dude = new cardWrapper
	y: Align.center()
	x: Align.center()

