extends Node3D
class_name MAPS

@export_group("player settings")
@export var player:Node3D

@export_group("camera settings", "camera")
@export var cameraDistance := 3.0
@export var cameraHeight := 1.5
@export_range(0.01,1.0,0.01) var cameraSmoothSpeed = 0.05
#@export var cameraSmoothSpeed := 0.05
@export var camera_follows_player := true

@onready var main_cam: Camera3D = $mainCam

#assets will be loaded here
#DO NOT CHANGE ANYTHING IN HERE

var assets := {
	"environment" : {
		#region environment example
		#"ball": {},
		#"phone": {},
		#endregion environment example
	},
	"characters": {
		#region characters' example
		#"owen": {
			#"idle": [],
			#"walking": [],
			#"emotions": {},
		#},
		#"sammy": {
			#"idle": [],
			#"walking": [],
			#"emotions": {},
		#},
		#endregion characters' example
	},
	"sounds" : {
		"text": []
	},
}

func _ready() -> void:
	main_cam.position.y = cameraHeight

func _process(delta: float) -> void:
	if camera_follows_player:
		cameraMovement()

##handle camera movement
func cameraMovement():
	var camPos := main_cam.position
	var playerPos := player.position
	var space = playerPos.z + cameraDistance
	
	#smooth out camera position
	camPos.x = lerpf(camPos.x, playerPos.x, cameraSmoothSpeed)
	camPos.y = lerpf(camPos.y, cameraHeight, cameraSmoothSpeed)
	camPos.z = lerp(camPos.z, space, cameraSmoothSpeed)
	
	main_cam.position = camPos
#region main functions
##parameters asdf
func loadAssets_characters(character:String, characterAssets:Dictionary):
	var loadedCharacters = {}
	for asset in characterAssets:
		loadedCharacters[asset] = load(characterAssets[asset])
	
	assets["characters"][character] = loadedCharacters
	loadedCharacters = null

func loadAssets_sounds(soundName:String,soundAssets:Array):
	var loadedSounds = []
	for sound in soundAssets:
		loadedSounds.append(load(sound))
	
	assets["sounds"][soundName] = loadedSounds
	loadedSounds = null
#endregion main functions
