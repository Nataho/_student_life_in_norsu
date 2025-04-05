extends Node3D

@onready var player: Sprite3D = $player

@export var SPEED := 100.0
func _process(delta: float) -> void:
	playerMovement(delta)

##variable for player rotation in relation to direction
var directionX = 0 

##handles player movement
func playerMovement(delta):
	
	var speed = (SPEED/50)*delta
	
	if Input.is_action_pressed("ui_left"):
		player.position.x -= speed
		directionX = 0
	if Input.is_action_pressed("ui_right"):
		player.position.x += speed
		directionX = 1
	
	if Input.is_action_pressed("ui_up"):
		player.position.z -= speed
	if Input.is_action_pressed("ui_down"):
		player.position.z += speed
	
	var playerRot = player.rotation_degrees.y
	playerRot = lerpf(playerRot,180*directionX,0.2)
	player.rotation_degrees.y = playerRot
