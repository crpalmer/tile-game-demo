extends CanvasLayer

var may_exit_menu = false

func _ready():
	GameEngine.modulate.visible = false
	$SaveGame.visible = false
	$Died.visible = false

func _process(_delta):
	if may_exit_menu and Input.is_action_just_released("menu"):
		set_visibility(not visible)

func set_visibility(on):
		visible = on
		GameEngine.paused = on

func player_died():
	set_visibility(true)
	$Died.visible = true

func _on_NewGame_pressed():
	GameEngine.modulate.visible = true
	set_visibility(false)
	$Died.visible = false
	may_exit_menu = true
	GameEngine.new_game("res://Dungeon/Dungeon.tscn", "entrance")
	GameEngine.player.connect("player_died", self, "player_died")

func _on_LoadGame_pressed():
	pass # Replace with function body.

func _on_SaveGame_pressed():
	pass # Replace with function body.
