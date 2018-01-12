

# rows = []
# 
# dude = rows

for i in [0...2]
	row = new Layer
		name: 'row ' + i
		y: i * 50
		height: 50
		width: Screen.width
	
	row.rightButton = new Layer
		parent: row
		height: row.height
		width: 100
		x: Align.right(100)
		backgroundColor: "red"
		
	row.leftButton = new Layer
		parent: row
		height: row.height
		width: 100
		x: Align.left()
		
	row.states =
		active:
			x: -100
			backgroundColor: 'green'
		inactive:
			x: 0
			backgroundColor: 'blue'
			
			
			
		pink:
			backgroundColor: 'pink'
			
# 	row.active = false
	
	do(row)->
# 		row.leftButton.onTap ->
# 			row.stateCycle()
		
		row.leftButton.onTap -> 
			row.active = true
			rowActive(@stateCycle)


	rowActive = (stateCycle) ->
		stateCycle = 
			if row.active is true 
				row.stateCycle("active")
			else 
				row.stateCycle("inactive")



# 	row.leftButton.onTap -> rowActive(@layer, @state)


# active = if row.active is true then print "active bro!"
	
# rowActive = (active, stateCycle) ->
# 	active = if row.active is true then print "active bro!"
# 	
# 	stateCycle = 
# 		if row.active is true 
# 			row.stateCycle("active")
# 		else 
# 			row.stateCycle("inactive")





	
# 	do(row) ->
# 		row.leftButton.onTap ->
# 			row.stateCycle("active")

# leftButton.onTap ->
# 	row.stateCycle("active")
# 		
# do(rows) ->
# 	rightButton.onTap ->
# 		rows.stateCycle("default")


# print rows
# print dude