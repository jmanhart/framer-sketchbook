bkg = new BackgroundLayer
	backgroundColor: '#E1E1E1'

spacer = 20

text_xlg = 32
text_lg = 26
text_med = 20
text_reg = 16
text_small = 12
text_xsmall = 10

fpo_color = "rgba(0,0,0,0.1)"

# Classes
class cardWrapper extends Layer
	constructor: (options) ->
		super _.defaults options,
			width: Screen.width * 0.90
			height: 250
			backgroundColor: 'white'
			shadowY: 2
			shadowBlur: 10
			borderRadius: 8
			clip: true
			
class title01 extends TextLayer
	constructor: (options) ->
		super _.defaults options,
			width: parent.width
			text: "Title 01"
			fontSize: text_xlg
			fontWeight: "bold"
			backgroundColor: fpo_color
			
class title02 extends TextLayer
	constructor: (options) ->
		super _.defaults options,
			width: parent.width
			text: "Title 02"
			fontSize: text_med
			backgroundColor: fpo_color
			
class body01 extends TextLayer
	constructor: (options) ->
		super _.defaults options,
			width: parent.width
			text: "Body 01"
			fontSize: text_small
			backgroundColor: fpo_color

# Data
cardData = [
	{
		title01: "Title One Great Job!"	
		title02: "This is a sub title"
		body01:"Lorem ipsum dolor amet franzen narwhal 3 wolf moon chia kale chips pickled. Cronut shoreditch twee, mlkshk food truck kale "
	},
]
	
	
card = new cardWrapper
	y: Align.center()
	x: Align.center()

#Var - for setting all children widths based on parent
cardContentWidth = card.width - (spacer*2)

title01 = new title01
	parent: card
	text: cardData[0].title01
	width: cardContentWidth 
	y: Align.top(spacer)
	x: Align.left(spacer)
	
title02 = new title02
	parent: card
	text: cardData[0].title02
	width: cardContentWidth
	y: title01.y + title01.height + spacer
	x: Align.left(spacer)
	
body01 = new body01
	parent: card
	text: cardData[0].body01
	width: cardContentWidth
	y: title02.y + title02.height + spacer
	x: Align.left(spacer)
	
	
	
