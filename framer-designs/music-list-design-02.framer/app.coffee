bkg = new BackgroundLayer
	backgroundColor: 'white'
	



# scroll = ScrollComponent.wrap(scroll_album)
# scroll.scrollHorizontal = false
# 
# scroll.contentInset =
# 	top: 0
# 	right: 0
# 	bottom: 20
# 	left: 0




# progress_bar.width = 0
# 
# progressAnimation = new Animation progress_bar,
# 	width: Screen.width
# 	options:
# 		time: 90
# 
# now_playing.states =
# 	a:
# 		y: Screen.height - now_playing.height
# 		
# now_playing.animationOptions =
# 	curve: Bezier.easeInOut
# 	time: 0.5
	
# song_05.onTap ->
# 	now_playing.stateCycle()
# 	progressAnimation.start()
	


songsData = [
	{
		album: "Nonagon Infinity"
		songs: [
			{
				name: "Robot Stop"
				duration: "5:22"
			},
			{
				name: "Big Fig Wasp"
				duration: "4:55"
			},
			{
				name: "Gamma Knife"
				duration: "4:21"
			},
			{
				name: "People-Vultures"
				duration: "4:46"
			},
			{
				name: "Mr. Beat"
				duration: "4:56"
			},
			{
				name: "Evil Death Roll"
				duration: "7:14"
			},
			{
				name: "Invisible Face"
				duration: "3:01"
			},
			{
				name: "Wah Wah"
				duration: "2:54"
			},
			{
				name: "Road Train"
				duration: "4:18"
			},
		]
	}
]

songList = new ScrollComponent
	size: Screen.size
	scrollHorizontal: false



# Import of Design Components
album_header.y = Align.top()
album_header.x = Align.center()
album_header.parent = songList.content

progress_bar.width = 0

now_playing.y = Align.bottom(now_playing.height)
now_playing.x = Align.center()


now_playing.states =
	a:
		y: Screen.height - now_playing.height


progressAnimation = new Animation progress_bar,
	width: Screen.width
	options:
		time: 90	
		
now_playing.animationOptions =
	curve: Bezier.easeInOut
	time: 0.5
	


for i in [0...songsData[i].songs.length]
	song = new Layer
		width: Screen.width
		height: song_01.height
		parent: songList.content
		y: (album_header.height + (song_01.height * i))
		backgroundColor: null
	song_number = new TextLayer
		text:  "#{i + 1}"
		parent:song
		fontSize: 17
		x: Align.left()
		y: Align.center()
		width: 55
		textAlign: 'center'
	song_name = new TextLayer
		text: songsData[0].songs[i].name
		parent:song
		fontSize: 15
		x: Align.left(song_number.width)
		y: Align.center(-10)
	album_name = new TextLayer
		text: songsData[0].album
		parent:song
		fontSize: 11
		x: Align.left(song_number.width)
		y: Align.center(10)
	song_length = new TextLayer
		text: songsData[0].songs[i].duration
		parent:song
		fontSize: 15
		x: Align.right()
		y: Align.center()
		width: 70
		textAlign: 'center'
		
	do(song) ->
		song.onTap ->
			now_playing.stateCycle("a")
			

now_playing.bringToFront()





	

