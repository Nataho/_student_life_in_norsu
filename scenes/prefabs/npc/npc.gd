extends AnimatedSprite3D
class_name NPC

var previousPosition:Vector3

func _ready() -> void:
	previousPosition = position
	#detectMovement()

var _direction = 0
func _process(delta: float) -> void:
	
	if position.x < previousPosition.x:
		_direction = 0
	elif position.x > previousPosition.x:
		_direction = 1
	
	rotation_degrees.y = lerpf(rotation_degrees.y, 180 * _direction, 0.2)
	
	previousPosition = position
	
