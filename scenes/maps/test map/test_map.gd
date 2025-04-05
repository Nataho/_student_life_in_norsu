extends Node3D

@onready var player: Sprite3D = $player
@onready var main_cam: Camera3D = $mainCam

@export var SPEED := 100.0
@export_group("camera")
@export var cameraDistance := 50
#func _ready() -> void:
func _process(delta: float) -> void:
	cameraMovement()
	playerMovement(delta)


var directionX = 0 #variable for player rotation
func playerMovement(delta):
	
	var speed = (SPEED/50)*delta
	
	if Input.is_action_pressed("ui_left"):
		player.position.x -= speed
		directionX = -1
	if Input.is_action_pressed("ui_right"):
		player.position.x += speed
		directionX = 0
	
	if Input.is_action_pressed("ui_up"):
		player.position.z -= speed
	if Input.is_action_pressed("ui_down"):
		player.position.z += speed
	
	var playerRot = player.rotation_degrees.y
	playerRot = lerpf(playerRot,180*directionX,0.2)
	player.rotation_degrees.y = playerRot

#handle camera movement
func cameraMovement():
	var camPos := main_cam.position
	var playerPos := player.position
	var space = playerPos.z + cameraDistance
	
	camPos.x = lerpf(camPos.x, playerPos.x, 0.05)
	camPos.z = lerp(camPos.z, space, 0.05)
	
	main_cam.position = camPos
