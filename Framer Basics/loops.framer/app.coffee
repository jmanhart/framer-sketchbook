
# Variables
## Item 
itemHeight = 50
itemWidth = 200
itemGutter = 20

## Type
labelLarge = 22
labelMedium = 18
labelSmall = 14

## Colors
dark01 = "#333333"
dark02 = "#555555"
light01 = "#555555"
light02 = "#BBBBBB"

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

# Loop setup
## for [reference(can be whatever)] on [0...objectName.length] It is important to follow this exactly. Two (..) is vastly different than (...) Use (.length) to match the number of items in your object.
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
		# Sets name in the side view #{i} is calling the variable
		name: "Label #{i + 1}"
		# Set parent for aligning 
		parent: itemWrapper
		# Set Text – calling an object for data
		## objectName[reference].tag
		text: itemProps[i].label
		# CSS in JS
		fontSize: labelMedium
		color: dark01
		# Aligning wihtin the parent
		x: Align.center()
		y: Align.center()