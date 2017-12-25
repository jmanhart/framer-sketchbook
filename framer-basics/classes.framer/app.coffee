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
			opacity: 0.5
			
class starWrapper extends Layer
	constructor: (options) ->
		super _.defaults options,
			height: 40
			width: 40
			svg: "<svg><path d='M 7 0 L 9.057 4.168 L 13.657 4.837 L 10.329 8.082 L 11.114 12.663 L 7 10.5 L 2.886 12.663 L 3.671 8.082 L 0.343 4.837 L 4.943 4.168 Z' fill="#CCC"/>"


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
		title01: "Merry Holidays"	
		title02: "This is a sub title"
		body01:"Lorem ipsum dolor amet franzen narwhal 3 wolf moon chia kale chips pickled. Cronut shoreditch twee, mlkshk food truck kale "
	},
]
	
	
# shape = new SVGLayer
# 	svg: "<svg><path d='M 7 0 L 9.057 4.168 L 13.657 4.837 L 10.329 8.082 L 11.114 12.663 L 7 10.5 L 2.886 12.663 L 3.671 8.082 L 0.343 4.837 L 4.943 4.168 Z' fill="#CCC"/>"

# <svg xmlns="http://www.w3.org/2000/svg" width="14" height="14"><path d="M 7 0 L 9.057 4.168 L 13.657 4.837 L 10.329 8.082 L 11.114 12.663 L 7 10.5 L 2.886 12.663 L 3.671 8.082 L 0.343 4.837 L 4.943 4.168 Z" fill="#CCC"/>

# shape = new SVGLayer
# 	svg: "<svg><path d='M0 0 H 200 V 200 H 0 L 0 0' />"



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
	


dude = new starWrapper
