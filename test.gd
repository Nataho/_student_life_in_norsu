extends Control

func _ready() -> void:
	WINDOW.set_resolution(WINDOW.RESOLUTION_1280X720)
	$Button2.size = $VBoxContainer/Label2.size
	$Button2.position = $VBoxContainer/Label2.global_position
	print($VBoxContainer/Label.global_position)
	print($VBoxContainer/Label2.global_position)
#func test():
	#WINDOW.toggle_fullscreen()
	#
	#if WINDOW.is_fullscreen():return
	#
