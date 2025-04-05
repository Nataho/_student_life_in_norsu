#extends Node
class_name WINDOW

#region constants
#16:9 aspect ratios
const RESOLUTION_1280X720 = Vector2i(1280,720) 
const RESOLUTION_1920X1080 = Vector2i(1920,1080)
#endregion constants

#toggles fullscreen
static func toggle_fullscreen():
	if !is_fullscreen():
		DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
		return
	DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
	
#region setters
#sets resolution, use RESOLUTION constants above
static func set_resolution(resolution:Vector2): 
	if is_fullscreen():
		toggle_fullscreen()
	DisplayServer.window_set_size(resolution)
	center_window()

#centers window, usually called after set_resolution()
static func center_window():
	var screen_size = DisplayServer.screen_get_size()
	var window_size = DisplayServer.window_get_size()
	var centered_position = (screen_size-window_size) / 2
	DisplayServer.window_set_position(centered_position)
#endregion setters

#region getters
#gets data if window is full screen or not.
static func is_fullscreen() -> bool:
	return DisplayServer.window_get_mode() == DisplayServer.WindowMode.WINDOW_MODE_FULLSCREEN
#endregion getters
