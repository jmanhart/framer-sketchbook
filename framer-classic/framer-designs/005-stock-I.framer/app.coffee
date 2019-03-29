# Prototype Information
Framer.Info =
	title: "Prototype"
	author: "John Manhart"
	description: "Test Build!"
	
# Disabling Hints for previewing
Framer.Extras.Hints.disable()

# Setting up preloader Image
Framer.Extras.Preloader.enable()
# Framer.Extras.Preloader.setLogo("https://twitter.com/framerjs/profile_image?size=bigger")

# Editing the device background color
Framer.Device.background.backgroundColor = "#1D212A"

# Changing the indicator to a cursor from white circle
document.body.style.cursor = "auto"


bkg = new BackgroundLayer
	backgroundColor: 'white'
	
	
# Create FlowComponent 
flow = new FlowComponent

 
flow.showNext(realTime)	
		
buyBtn.onTap ->
	flow.showOverlayBottom(shareAdd)
	
closeBtn.onTap ->
	flow.showPrevious()