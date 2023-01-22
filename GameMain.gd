extends Node2D

export var debug_scene:String
export var debug_entry_point:String

func _ready():
	if debug_scene != "": GameEngine.enter_scene(debug_scene, debug_entry_point)
	else: $MainMenu.visible = true
