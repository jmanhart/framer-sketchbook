
# Variables
itemHeight = 50
itemWidth = 200
itemGutter = 20

# JS Object for setting specific attributes
itemProps = [
	{
		label: "Carrots",
	},
	{
		label: "Peas",
	},
	{
		label: "Potatoes",
	},
	{
		label: "Coffee",
	},
	{
		label: "Green Beans",
	},
	{
		label: "Coffee",
	},
	{
		label: "Bread",
	},
]

for i in [0...itemProps.length]

	# Container – For each row. This is parent for entire loop.
	itemWrapper = new Layer
		# Sets name in the side view #{i} is calling the variable
		name: "Item #{i + 1}"
		
		# Refrencing set variables
		width: itemWidth 
		height: itemHeight
		
		# Aligning – This is in relation to the parent element. 
		## X Axis
		x: Align.center()
		## Y Axis - To set in column need to equation for height & gutters
		y: Align.top(10 + ((itemHeight + itemGutter) * i))
	
	# Text – Specific Default Class for Text
	itemLabel = new TextLayer
		# Set parent for aligning 
		parent: itemWrapper
		# Set Text – calling an object for data
		## objectName[reference].tag
		text: itemProps[i].label
		# CSS in JS
		fontSize: 16
		# Aligning wihtin the parent
		x: Align.center()
		y: Align.center()