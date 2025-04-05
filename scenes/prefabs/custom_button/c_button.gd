extends Button
class_name CUSTOM_BUTTON

@export_group("label Properties")
@export var textColor:Color = Color(1,1,1,1)
@export var upperCase:bool = false

@onready var label: Label = %text
var settings := LabelSettings.new()

func _ready() -> void:
	_update_button_text()
	
#get properties of button and transfer to label
func _update_button_text():
	var parent_font_size = self.get_theme_font_size("font_size")
	var parent_font = self.get_theme_font("font")
	
	#region handle font
	settings.font_size = parent_font_size
	settings.font = parent_font
	settings.font_color = textColor
	#endregion handle font
	
	#region handle label
	label.uppercase = upperCase
	label.horizontal_alignment = alignment
	
	label.text = text
	text = ""
	#endregion handle label
	label.label_settings = settings
	
func focus():
	grab_focus()
