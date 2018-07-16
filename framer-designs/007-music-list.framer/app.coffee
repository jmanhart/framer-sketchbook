# playlist = [
# 	{	
# 		title: "Robot Stop",
# 		time: "5:22",
# 	}
# 	{	
# 		title: "Big Fig Wasp",
# 		time: "4:54",
# 	}
# 	{	
# 		title: "Gamma Knife",
# 		time: "4:21",
# 	}
# ]


album = [
	name: "dog"
	details = [
		{	
			title: "Robot Stop",
			time: "5:22",
		}
		{	
			title: "Big Fig Wasp",
			time: "4:54",
		}
		{	
			title: "Gamma Knife",
			time: "4:21",
		}
	]
]



for i in [0...album.length]
	title = new TextLayer
		text: album.name[]
		fontSize: 22
		y: 28 * i
		
	time = new TextLayer
		text: playlist[i].time
		fontSize: 22
		y: 28 * i
		x: Align.right()