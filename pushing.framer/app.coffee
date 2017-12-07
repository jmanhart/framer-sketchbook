

onDevice = []

offDevice = []
# 
# onDeviceContainer = new Layer
	
for i in [0...3]
	item = new Layer
		name: "Item #{i}"
		width: Screen.width
		height: 44
		y: 150 + (45 * i)
		backgroundColor: '#1A1A1A'
		shadowY: 1
		shadowColor: '#555555'
		
	trigger = new Layer
		parent: item
		size: 25
		x: Align.left(10)
		y: Align.center()
		borderRadius: 25
		
	do(item) ->
		trigger.onTap ->
			item.destroy()
# 			offDevice.push(item)
			offDevice.push item
			
			
	onDevice.push item
	
	



for i in [0...offDevice.length]
	item = new Layer
		name: "Item #{i}"
		width: Screen.width
		height: 44
		y: 350 + (45 * i)
		backgroundColor: 'yellow'
		shadowY: 1
		shadowColor: '#555555'
		


		
print offDevice