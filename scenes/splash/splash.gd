extends Control

func _ready() -> void:
	$anim.play("show all")
	await $anim.animation_finished
	get_tree().change_scene_to_file("res://scenes/main scenes/menu/menu.tscn")
