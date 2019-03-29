
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
light01 = "#AAAAAA"
light02 = "#BBBBBB"

# JS Object for setting specific attributes
itemProps = [
	{
		label: "Carrots",
		amount: 3,
	},
	{
		label: "Peas",
		amount: 2 + " cans",
	},
	{
		label: "Potatoes",
		amount: 10 + " lbs",
	},
	{
		label: "Coffee",
		amount: 10 + " lbs",
	},
]

# Loop setup
## for [reference(can be whatever)] on [0...objectName.length] It is important to follow this exactly. Two (..) is vastly different than (...) Use (.length) to match the number of items in your object.
for i in [0...itemProps.length]

	# Container – For each row. This is parent for entire loop.
	itemWrapper = new Layer
		# Sets name in the side panel #{i} is calling the variable
		# arrayName(itemProps)[i].key(label) - This changes the name
		name: itemProps[i].label
		# Refrencing set variables
		width: itemWidth 
		height: itemHeight
		# Aligning – This is in relation to the parent element. 
		## X Axis
		x: Align.center()
		## Y Axis - To set in column need to equation for height & gutters
		y: Align.top(200 + ((itemHeight + itemGutter) * i))
		# Cosmetics - Setting the styles
		## If you do not set null the default layer class will be gray
		backgroundColor: null
		borderColor: light02
		borderWidth: 1.5
		borderRadius: 2
		
	# Text – Specific Default Class for Text
	itemLabel = new TextLayer
		# Sets name in the side view #{i} is calling the variable
		name: itemProps[i].label + " Label"
		# Set parent for aligning 
		parent: itemWrapper
		# Set Text – calling an object for data
		## objectName[reference].tag
		text: itemProps[i].label
		# CSS in JS
		fontSize: labelMedium
		color: dark01
		# Aligning wihtin the parent
		x: Align.left(itemGutter)
		y: Align.center(1)
		
	# Text – Specific Default Class for Text
	itemAmount = new TextLayer
		# Sets name in the side view #{i} is calling the variable
		name: itemProps[i].amount + " items"
		# Set parent for aligning 
		parent: itemWrapper
		# Set Text – calling an object for data
		## objectName[reference].tag
		text: itemProps[i].amount
		# CSS in JS
		fontSize: labelSmall
		color: dark01
		# Aligning wihtin the parent
		x: Align.right(-itemGutter)
		y: Align.center(1)