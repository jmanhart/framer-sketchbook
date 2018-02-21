
settingsData = [
	{
		sectionTitle: "Apperance"
		backgroundColor:"gray"
	}
	{
		sectionTitle: "Sounds & Alert"
		backgroundColor:"gray"
	}
	{
		sectionTitle: "General"
		backgroundColor:"gray"
	}
	{
		sectionTitle: "System"
		backgroundColor:"gray"
	}
]

settingsRoot = new Layer
	size: Screen.size
	backgroundColor: "gray"

# Empty Arrays of subpages
subPages = []
settingsRow = []

for i in [0...settingsData.length]
	subPage = new Layer
		size: Screen.size
		backgroundColor: settingsData[i].backgroundColor
		name: settingsData[i].sectionTitle
	subPageTitle = new TextLayer
		parent: subPage
		text: settingsData[i].sectionTitle
		color: 'black'
		x: Align.center()
		y: Align.center(-40)
	subPages.push subPage
		
flow = new FlowComponent
flow.showNext(settingsRoot)

for i in [0...settingsData.length]
	row = new Layer
		parent: settingsRoot
		width: Screen.width
		height: 60
		y: i * 65
		backgroundColor: 'white'
	rowText = new TextLayer
		text: settingsData[i].sectionTitle
		parent: row
		fontSize: 18
		x: Align.left(20)
		y: Align.center()
	
	settingsRow.push row

for i in [0...settingsRow.length]
	subPages[i].onClick ->
		flow.showPrevious()

# Row Taps to Sub pages 
# TODO: This needs to be cleaned up
settingsRow[0].onClick ->
	flow.showNext(subPages[0])
	
settingsRow[1].onClick ->
	flow.showNext(subPages[1])
	
settingsRow[2].onClick ->
	flow.showNext(subPages[2])
	
settingsRow[3].onClick ->
	flow.showNext(subPages[3])

