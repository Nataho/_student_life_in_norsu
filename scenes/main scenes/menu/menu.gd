extends Node2D

@onready var buttons = {
	"play": $UI/VBoxContainer/play,
	"debug": $UI/VBoxContainer/debug,
	"quit": $UI/VBoxContainer/quit,
} 

func _ready() -> void:
	buttons["play"].focus()

func _quit():
	get_tree().quit()
