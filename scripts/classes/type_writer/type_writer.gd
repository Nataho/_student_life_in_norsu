extends Node
class_name TYPEWRITER

var CPS:float = 15 #Characters per second
var index = 0 #index of character in string
var playing = false #playing bool
var buffer:String = ""#text that is to be shown
var isWait:bool = false
var isInstant:bool = false

func _init(cps = 50, wait = true, instant = false) -> void:
	CPS = cps
	isWait = wait
	isInstant = instant
	_convertCPS()
	name = "typewriter"

func _convertCPS():
	CPS = 10 / CPS
	print(CPS)

func write(dialogue:String = ""):
	var letter: String
	playing = true
	
	if dialogue == "": return
	letter = dialogue[index]
	
	if !isInstant: await get_tree().create_timer(0.1*CPS).timeout
	
	if DEBUG.isDebug: print(self.name, ": " , letter)
	match letter:
		".": 
			if isWait: await get_tree().create_timer(0.25).timeout
		"_": 
			if isWait: await get_tree().create_timer(0.25).timeout
			letter = ""
	
	index += 1
	if index > dialogue.length()-1:
		index = 0
		playing = false
	return letter
