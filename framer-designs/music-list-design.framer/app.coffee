now_playing.y = Screen.height


scroll = ScrollComponent.wrap(scroll_album)
scroll.scrollHorizontal = false

scroll.contentInset =
	top: 0
	right: 0
	bottom: 20
	left: 0




progress_bar.width = 0

progressAnimation = new Animation progress_bar,
	width: Screen.width
	options:
		time: 90

now_playing.states =
	a:
		y: Screen.height - now_playing.height
		
now_playing.animationOptions =
	curve: Bezier.easeInOut
	time: 0.5
	
song_05.onTap ->
	now_playing.stateCycle()
	progressAnimation.start()
	