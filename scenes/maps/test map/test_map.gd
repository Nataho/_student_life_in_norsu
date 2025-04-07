extends Node3D

@onready var player: Sprite3D = $player
@onready var npc: NPC = $NPC

@export var SPEED := 100.0

var playerProperties = {
	"previous position": Vector3(),
	"current position": Vector3()
}
func _process(delta: float) -> void:
	playerMovement(delta)
	#move_NPC(delta)
	
##variable for player rotation in relation to direction
var directionX = 0 

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("ui_accept"):
		$AnimationPlayer.play("move block")

##handles player movement
func playerMovement(delta):
	var speed = (SPEED/50)*delta
	
	if Input.is_action_pressed("ui_left"):
		player.position.x -= speed
		#directionX = 0
		
	if Input.is_action_pressed("ui_right"):
		player.position.x += speed
		#directionX = 1
	
	if Input.is_action_pressed("ui_up"):
		player.position.z -= speed
	if Input.is_action_pressed("ui_down"):
		player.position.z += speed
	
	playerProperties["current position"] = player.position
	
	if player.position.x < playerProperties["previous position"].x:
		directionX = 0
	elif player.position.x > playerProperties["previous position"].x:
		directionX = 1
	
	var playerRot = player.rotation_degrees.y
	playerRot = lerpf(playerRot,180*directionX,0.2)
	#playerRot = 180 * directionX
	player.rotation_degrees.y = playerRot
	
	playerProperties["previous position"] = player.position

var NPCdirectionX = -1 #[-1 and 1]
func move_NPC(delta):
	var speed = (SPEED/50)*delta
	npc.position.x += speed * NPCdirectionX

func toggle_npc_movement():
	match NPCdirectionX:
		1: NPCdirectionX = -1
		-1: NPCdirectionX = 1
