# Add the following line to your project in Framer Studio.
# myModule = require "myModule"
# Reference the contents by name, like myModule.myFunction() or myModule.myVar

exports.myVar = "myVariable"

exports.myFunction = ->
	print "myFunction is running"

exports.myArray = [1, 2, 3]



# dude = 40
# tabCount = 4
#
#
# exports.tabBarModule = ->
#   tabBarContainer = new Layer
#     name: "tabBarContainer"
#     width: Screen.width
#     height: dude
#     backgroundColor: 'pink'
#     x: Align.center()
#     y: Align.bottom()
#
#   tab = new Layer
#     parent: tabBarContainer
#     width: tabBarContainer.width / tabCount
#     height: tabBarContainer.height

# class GhostLayer extends Layer
# 	constructor: (@options={}) ->
# 		@options.translucent ?= false
# 		super @options
# 		@.onClick @fade
#
# 		if @options.translucent is true
# 			@.opacity = 0.5
#
# 	@define 'translucent',
# 		get: ->
# 			@options.translucent
# 		set: (value) ->
# 			@options.translucent = value
# 			if @options.translucent is true
# 				@.opacity = 0.5
# 			else
# 				@.opacity = 1.0
#
# 	fade: Utils.debounce 0.5, ->
# 		Utils.delay 0.5, =>
# 			if @options.translucent is true
# 				@options.translucent = false
# 				@.animate
# 					properties:
# 						opacity: 1.0
# 			else
# 				@options.translucent = true
# 				@.animate
# 					properties:
# 						opacity: 0.5
#
# module.exports = GhostLayer


# tabCount = 4
# tabBarHeight = 50
#
#
# class Dude extends Layer
#     constructor: (options) ->
#         super _.defaults options,
#           name: "tab"
#           width: 200
#           height: 300
#           x: 200
#           backgroundColor: null
#
# exports.Dude
#
#
#
# exports.tabBarModule = ->
#   tabBarContainer = new Layer
#     name: "tabBarContainer"
#     width: Screen.width
#     height: tabBarHeight
#     backgroundColor: 'white'
#     x: Align.center()
#     y: Align.bottom()
#
#   for i in [0...tabCount]
#     tab = new Tab
#       name: "tab"
#       parent: tabBarContainer
#       width: tabBarContainer.width / tabCount
#       height: tabBarContainer.height
#       x: (tabBarContainer.width / tabCount) * i
#       backgroundColor: null
#
#     tabText = new TextLayer
#       name: "Tab Label #{i + 1}"
#       parent: tab
#       fontSize: 14
#       x: Align.center()
#       y: Align.center()
#       text: "Tab"
#       color: "black"
#       backgroundColor: null



# class TextInput extends Layer
# 	constructor: (options) ->
# 		super _.defaults options,
# 			x: Align.center()
# 			y: Align.bottom()
# 			width: Screen.width
# 			height: 60
# 			backgroundColor: 'white'
#
#
#
# exports.TextInput = TextInput

# abCount = 5
#
#
# class TextInput extends Layer
# # exports.TextInput = ->
#   tabBarContainer = new Layer
#     x: Align.center()
#     y: Align.bottom()
#     width: Screen.width
#     height: 60
#     backgroundColor: 'green'
#
#   for i in [0...tabCount]
#     tab = new Layer
#       name: "tab"
#       parent: tabBarContainer
#       width: tabBarContainer.width / tabCount
#       height: tabBarContainer.height
#       x: (tabBarContainer.width / tabCount) * i
#       backgroundColor: null
#
#     tabText = new TextLayer
#       name: "Tab Label #{i + 1}"
#       parent: tab
#       fontSize: 14
#       x: Align.center()
#       y: Align.center()
#       text: "Tab"
#       color: "black"
#       backgroundColor: null
#
# exports.TextInput = TextInput
