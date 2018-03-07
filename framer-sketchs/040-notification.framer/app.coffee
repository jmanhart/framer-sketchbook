notificationContainerSize = 50


container = new Layer
	size: 120
	x: Align.center()
	y: Align.center()
	borderRadius: 10
	backgroundColor: 'teal'
	
notificationOuter = new Layer
	parent: container
	height: notificationContainerSize
	width: notificationContainerSize + 1
	x: Align.right(notificationContainerSize/2.5)
	y: Align.top(-(notificationContainerSize/2.5))
	borderRadius: (notificationContainerSize/2)
	backgroundColor: 'white'
	
notificationInner = new Layer
	parent: notificationOuter
	height: notificationContainerSize - 10
	width: notificationContainerSize - 10
	x: Align.center()
	y: Align.center()
	borderRadius: (notificationContainerSize/2)
	backgroundColor: 'red'
	