settingsRowHeight = 44
settingsRowBackgroundColor = '#1A1A1A'
settingsRowLeftSidePadding = 15
settingsRowRightSidePadding = 25

settingsPrimaryLabelColor = '#ffffff'
settingsPrimaryLabelSize = 17
settingsSecondaryLabelSize = 17
settingsSecondaryLabelColor = '#8F8E94'

settingShadowInset = 16
settingsShadowWidth = 1
settingsShadowColor = "#555555"

class SettingsRowLabelChevron extends Layer
	constructor: (options) ->
		super _.defaults options,
			width: Screen.width
			height: settingsRowHeight
			backgroundColor: settingsRowBackgroundColor
			shadow1:
				x: 0
				y: -(settingsShadowWidth)
				color: settingsShadowColor
			shadow2:
				x: 0
				y: settingsShadowWidth
				color: settingsShadowColor

		primaryLabel = new TextLayer
			parent: @
			text: "Row Title"
			fontSize: settingsPrimaryLabelSize
			color: 'white'
			x: Align.left(settingsRowLeftSidePadding)
			y: Align.center()
		
		chevron = new Layer
			parent: @
			size:13
			backgroundColor: null
			x: Align.right(-25)
			y: Align.center()
			rotation: 45
			shadow1:
				x: 3
				y: -3
				color:settingsShadowColor

		

class SettingsRowLabelLabelChevron extends Layer
	constructor: (options) ->
		super _.defaults options,
			width: Screen.width
			height: settingsRowHeight
			backgroundColor: settingsRowBackgroundColor
			shadow1:
				x: 0
				y: -(settingsShadowWidth)
				color: settingsShadowColor
			shadow2:
				x: 0
				y: settingsShadowWidth
				color: settingsShadowColor

		primaryLabel = new TextLayer
			parent: @
			text: "Row Title"
			fontSize: settingsPrimaryLabelSize
			color: 'white'
			x: Align.left(settingsRowLeftSidePadding)
			y: Align.center()
			
		secondaryLabel = new TextLayer
			parent: @
			text: "100"
			color: settingsSecondaryLabelColor
			fontSize: settingsSecondaryLabelSize
			x: Align.right(-(settingsRowRightSidePadding + 13))
			y: Align.center()	
		
		chevron = new Layer
			parent: @
			size:13
			backgroundColor: null
			x: Align.right(-25)
			y: Align.center()
			rotation: 45
			shadow1:
				x: 3
				y: -3
				color:settingsShadowColor





for i in [0..4]
	row = new SettingsRowLabelLabelChevron
	# 	type: panther
		x: 0
		y: 100 + (i*44)






# 		primaryLabel = new TextLayer
# 			parent: @
# 			text: "Row Title"
# 			fontSize: settingsPrimaryLabelSize
# 			color: 'white'
# 			x: Align.left(20)
# 			y: Align.center()
# 		
# 		if @type == dude
# 			secondaryLabel = new TextLayer
# 				parent: @
# 				text: "100"
# 				color: settingsSecondaryLabelColor
# 				fontSize: settingsSecondaryLabelSize
# 				x: Align.right(-20)
# 				y: Align.center()			
# 		else @type == panther
# 			secondaryLabel = new TextLayer
# 				parent: @
# 				text: "10000"
# 				color: settingsSecondaryLabelColor
# 				fontSize: settingsSecondaryLabelSize
# 				x: Align.right(-20)
# 				y: Align.center()
	
	
	
	
	