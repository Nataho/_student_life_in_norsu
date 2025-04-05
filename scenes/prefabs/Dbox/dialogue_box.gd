extends CanvasLayer
class_name DBOX

@onready var indicator: ColorRect = $Box/background/indicator

@onready var lines = [
	$"Box/background/1 line",
	$"Box/background/2 lines",
	$"Box/background/3 lines"
]

var dialogue =  STORY._testDialogue

var dIndex = 0
var typeWriter:TYPEWRITER = TYPEWRITER.new(100)
var startTypeWriter:TYPEWRITER = TYPEWRITER.new(1, false, true)

func _ready() -> void:
	WINDOW.set_resolution(WINDOW.RESOLUTION_1280X720)
	add_child(typeWriter)
	#next()

func next() -> void:
	await _reset()
	if dIndex >= dialogue.size(): return
	var sizes = [] #contain the size labels
	var labels = [] #contain the wite labels
	
	match dialogue[dIndex][3].size()-1: #switch case for size of text in dialogue
		0: sizes = (%"1 line".get_children())
		1: sizes = (%"2 lines".get_children())
		2: sizes = (%"3 lines".get_children())
		
	for node in sizes: labels += node.get_children() #get children for each node in sizes
	
	for index in range(0,sizes.size()): #loop for size of sizes
		var text = dialogue[dIndex][3][index][0] #get text of dialogue
		#sizes[index].text = text #set size for writing text
		startTypeWriter.playing = true
		while startTypeWriter.playing:
			var letter:String = await startTypeWriter.write(text)
			sizes[index].text += letter
		
		typeWriter.playing = true
		while typeWriter.playing: #write text
			var letter:String = await typeWriter.write(text)
			labels[index].text += letter #write letter to label
	dIndex += 1
	indicator.show()

#an internal function that resets the dialogue box
func _reset():
	indicator.hide()
	
	var nodes:Array = []
	for node in lines:
		var children = node.get_children()
		
		for child in children:
			nodes.append(child)
			var kids = child.get_children()
			
			for kid in kids:
				nodes.append(kid)
	for label:Label in nodes:
		label.text = ""
