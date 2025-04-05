#extends Node
class_name STORY

#parameters to consider
#["type if box"] = Dialogue Box("DBox") / Bubble Box("BBox"); this will not be case sensitive.

const _exampleDialogue = [
	#["character", "emotion", ["type of box"], [ ["line1","property"], ["line2","property"]]],
	["anthony", "sad", ["BBox"], [ ["h-hinde... hinde pwede yan...","normal"],["___ayoko uminom nyan"] ] ],
	["anthony", "sad", ["DBox"], [ ["gusto ko red, ___na c2, ___sa aken__"], ["sa aken ibigay___, ang c2___, sa aken__."] ]]
]

const _testDialogue = [
	["owen", "neutral", ["DBox"], [ ["hey,__ you are testing the Dialogue"] ]],
	["owen", "neutral", ["Dbox"], [ ["that's very nice!"] ]],
	["owen", "neutral", ["Dbox"], [ ["as you can see in the 'STORY' class"], ["there's an example dialogue there"] ]],
	["owen", "neutral", ["Dbox"], [ ["you can use it anytime to test something out!"] ]],
	["owen", "neutral", ["Dbox"], [ ["even though it's not perfect yet"] ]],
	["owen", "neutral", ["Dbox"], [ ["it's pretty easy to get used to it!"] ]],
	["owen", "neutral", ["Dbox"], [ ["the programmer who made this is Owen!____"], ["he just wants a way to make this in vanilla"] ]],
]

const dialogues = {
	"prologue" : {
		"part 1": {
			"start": "wow",
			"group chat": "amen",
			"end": "asdf"
		}
	},
	"chapter 1": {
		"part 1" : {
			"start": "wow"
		}
	}
}
