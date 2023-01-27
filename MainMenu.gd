extends CanvasLayer

var may_exit_menu = false

func playing_game(on):
	get_node("/root/GameMain/CanvasModulate").visible = on
	get_node("/root/GameMain/HUD").visible = on
	may_exit_menu = on
	visible = not on
	$Died.visible = not on
	$SaveGame.visible = on
	
func _ready():
	playing_game(false)
	$SaveGame.visible = false
	$Died.visible = false

func _process(_delta):
	if Input.is_action_just_released("menu"):
		if visible and may_exit_menu: set_visibility(false)
		elif not GameEngine.is_paused(): set_visibility(true)

func set_visibility(on):
	visible = on
	if on: GameEngine.pause()
	else: GameEngine.resume()

func player_died():
	set_visibility(true)
	may_exit_menu = false
	$Died.visible = true
	$SaveGame.visible = false

func _on_NewGame_pressed():
	playing_game(true)
	GameEngine.new_game()
	GameEngine.player.connect("player_died", self, "player_died")

func _on_LoadGame_pressed():
	playing_game(true)
	if not GameEngine.load_saved_game("res://savegame.tres"):
		GameEngine.message("Failed to load saved game")
	GameEngine.player.connect("player_died", self, "player_died")

func _on_SaveGame_pressed():
	if not GameEngine.save_game("res://savegame.tres"):
		GameEngine.message("Failed to save game")

