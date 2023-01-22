extends Main

export var debug_scene:String
export var debug_entry_point:String

func _ready():
	GameEngine.modulate.visible = true
	if debug_scene != "": GameEngine.enter_scene(debug_scene, debug_entry_point)
	else: GameEngine.enter_scene("res://MainMenu.tscn")
