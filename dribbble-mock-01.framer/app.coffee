bkg = new BackgroundLayer
	backgroundColor: "#7493FC"

circleSmallSize = 500
heroContainerHeight = 200



bkCircleSmall = new Layer
	size: circleSmallSize
	borderRadius: circleSmallSize
	backgroundColor: "#4153B6"
	x: Align.left(-(circleSmallSize/2))
	y: Align.top(-(circleSmallSize/2))

bkCircleLarge = new Layer
	size: (circleSmallSize/1.5)
	borderRadius: circleSmallSize
	backgroundColor: "#4153B6"
	x: Align.right((circleSmallSize/5))
	y: Align.bottom((circleSmallSize/5))

screenFrame = new Layer
	width: 375
	height: 550
	y: Align.bottom()
	x: Align.center()
	backgroundColor: 'white'
	shadowY: 0
	shadowX: -2
	shadowSpread: 0
	opacity: 1
	shadowBlur: 20
	shadowColor: 'rgba(0,0,0,0.2)'

scroll = new ScrollComponent
	parent: screenFrame
	size: screenFrame.size
	backgroundColor: null
	scrollHorizontal: false

heroContainer = new Layer
	parent: screenFrame
	height: 200
	width: screenFrame.width
	backgroundColor: "#7785EE"
	
# heroThumbnail = new Layer
# 	parent: heroContainer
# 	size: 110
# 	backgroundColor: 'rgba(0,0,0,0.1)'
# 	borderRadius: 90
# 	x: Align.center
# 	y: Align.center
# 	
tabContainer = new Layer
	parent: screenFrame
	height: 60
	width: screenFrame.width
	y: heroContainer.height
	backgroundColor: 'white'
	
scrollContent = new Layer
	parent: scroll.content
	y: heroContainer.height 
	width: screenFrame.width
	height: 1000 
	backgroundColor: '#E8E8E8'
	clip: true


scroll.content.on "change:y", ->
# 	Utils.modulate(value, [a, a], [b, b], limit)
	heroContainer.height = Utils.modulate(scroll.scrollY, [scroll.width*0, heroContainerHeight], [heroContainerHeight,50], true)
	tabContainer.y = Utils.modulate(scroll.scrollY, [scroll.width*0, heroContainerHeight], [200, 50], true)

