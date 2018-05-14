bkg = new BackgroundLayer
	backgroundColor: 'white'
	
	
# Create FlowComponent 
flow = new FlowComponent

 
flow.showNext(shareAdd)	
		
buyBtn.onTap ->
	flow.showOverlayBottom(buyScreen)
	
closeBtn.onTap ->
	flow.showPrevious()