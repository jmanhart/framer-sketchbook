{LottieLayer} = require 'LottieLayer'

bkg = new BackgroundLayer
	backgroundColor: '#D6DCFA'

animationStart = 0

# Variables
pageCount = 4
gutter = 60


animationInfo = [
	{
		name: "anim01",
		path: "images/project-lottie/test-animation-01/test-animation-01.json",	
	},
	{
		name: "anim02",
		path: "images/project-lottie/test-animation-02/test-animation-02.json",	
	},
	{
		name: "anim03",
		path: "images/project-lottie/test-animation-03/test-animation-03.json",
	},
	{
		name: "anim04",
		path: "images/project-lottie/test-animation-04/test-animation-04.json",		
	},
]

# Create PageComponent
pageScroller = new PageComponent
	point: Align.center
	width: Screen.width
	height: 300
	scrollVertical: false
	clip: false

# Loop to create pages
for i in [0...pageCount]
	page = new Layer
		size: pageScroller.size
		x: (pageScroller.width + gutter) * i
		parent: pageScroller.content

		
	customAnim = new LottieLayer
		name: animationInfo[i].name
		path: animationInfo[i].path
		speed: 1
		autoplay: true
		loop: true
		x: Align.center()
		y: Align.center()
		size: 250
		parent: page
	
	replayIcon.onTap ->
		# Rest for animation to start at the 0 frame
		anim01.goToAndStop( animationStart )
		# Re-starting the animaition 
		anim01.play()

# Replay Icon
replayIcon.x = Align.center()
replayIcon.y = Align.center(300)
	

# customAnim.onComplete ->
# 	print 'Animation complete'

	
	
# replayIcon.onTap ->well
# 	customAnim.play()
	

# replayIcon.onTap ->
# 	# Rest for animation to start at the 0 frame
# 	customAnim.goToAndStop( animationStart )
# 	# Re-starting the animaition 
# 	customAnim.play()
	
	

	

	
	


