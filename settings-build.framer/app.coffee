bkg = new BackgroundLayer
	backgroundColor: '#121212'

rowHeight = 44
rowBkgColor = '#1A1A1A'
rowDividerColor = '#555555'
rowDividerWidth	= 1
rowIndent = '15px'

rowLabelColor = '#FFFFFF'
rowLabelFontSize = '17px'


# Row Classes
class rowStandAlone extends Layer
	constructor: (options) ->
		super _.defaults options,
			width: Screen.width
			height: rowHeight
			backgroundColor: rowBkgColor
			shadow1:
				y: -(rowDividerWidth)
				x: 0
				blur: 0
				color: rowDividerColor
			shadow2:
				y: (rowDividerWidth)
				x: 0
				blur: 0
				color: rowDividerColor
			html: "Hello"
			style:
				"font-size":"#{rowLabelFontSize}"
				"color":"#{rowLabelColor}"
				"display":"flex"
				"align-items":"center"
				"padding-left":"#{rowIndent}"
			
			
class rowTop extends Layer
	constructor: (options) ->
		super _.defaults options,
			width: Screen.width
			height: rowHeight
			backgroundColor: rowBkgColor
			shadow1:
				y: -(rowDividerWidth)
				x: 0
				blur: 0
				color: rowDividerColor
			shadow2:
				y: (rowDividerWidth)
				x: parseInt(rowIndent)
				blur: 0
				color: rowDividerColor
			html: "Row Container Top"
			style:
				"font-size":"#{rowLabelFontSize}"
				"color":"#{rowLabelColor}"
				"display":"flex"
				"align-items":"center"
				"padding-left":"#{rowIndent}"
				
class rowBottom extends Layer
	constructor: (options) ->
		super _.defaults options,
			width: Screen.width
			height: rowHeight
			backgroundColor: rowBkgColor
			shadow1:
				y: -(rowDividerWidth)
				x: parseInt(rowIndent)
				blur: 0
				color: rowDividerColor
			shadow2:
				y: (rowDividerWidth)
				x: 0
				blur: 0
				color: rowDividerColor
			html: "Row Container Top"
			style:
				"font-size":"#{rowLabelFontSize}"
				"color":"#{rowLabelColor}"
				"display":"flex"
				"align-items":"center"
				"padding-left":"#{rowIndent}"

turd = "new rowTop"

dummy = [
	{
		poop:"rowTop"
	}
	{
		poop:"rowBottom"
	}
]

for i in [0...dummy.length]
	dude = new Layer
		x:Align.center()
		y:Align.top(100 + (rowHeight * i))

# rowTop = new rowTop
# 	name: "Row Top" 
# 	x:Align.center()
# 	y:Align.top(40)
# 
# rowBottom = new rowBottom
# 	name: "Row Top" 
# 	x:Align.center()
# 	y:Align.top(100)
# 
# rowOne = new rowStandAlone
# 	html: "All Data Fields"
# 	name: "Row" 
# 	x:Align.center()
# 	y:Align.center()



# class textInput extends Layer
# 	constructor: (options) ->
# 		super _.defaults options,
# 			x: Align.center()
# 			y: Align.center()
# 			width: Screen.width - (spacer*2)
# 			height: 60
# 			borderWidth: 2
# 			borderColor: 'white'
# 			backgroundColor: null
# 			html: "sample string"
# 			style:
# 				"font-size":"0.75em"
# 				"display":"flex"
# 				"align-items":"center"
# 				"justify-content":"flex-start"
# 				"padding":"0em 1em"









# rowContainer = new Layer
# 	width: Screen.width
# 	height: rowHeight
# 	backgroundColor: rowBkgColor
# 	x:Align.center()
# 	y:Align.center()
# 	shadow1:
# 		y: -(rowDividerWidth)
# 		x: 0
# 		blur: 0
# 		color: rowDividerColor
# 	shadow2:
# 		y: (rowDividerWidth)
# 		x: 0
# 		blur: 0
# 		color: rowDividerColor
# 		
# rowLabel = new TextLayer
# 	parent: rowContainer
# 	text: "All Data Fields"
# 	fontSize: 17
# 	color: rowLabelColor
# 	x: Align.left(rowIndent)
# 	y: Align.center()