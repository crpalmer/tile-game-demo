extends CanvasLayer

var may_exit_menu = false

func playing_game(on):
	get_node("/root/GameMain/CanvasModulate").visible = on
	get_node("/root/GameMain/HUD").visible = on

func _ready():
	playing_game(false)
	$SaveGame.visible = false
	$Died.visible = false
	GameEngine.fade_anim = get_node("/root/GameMain/Fade/AnimationPlayer")

func _process(_delta):
	if may_exit_menu and Input.is_action_just_released("menu"):
		set_visibility(not visible)

func set_visibility(on):
	visible = on
	if on: GameEngine.pause()
	else: GameEngine.resume()

func player_died():
	set_visibility(true)
	$Died.visible = true

func _on_NewGame_pressed():
	playing_game(true)
	set_visibility(false)
	$Died.visible = false
	may_exit_menu = true
	GameEngine.new_game("res://Dungeon/Dungeon.tscn", "entrance")
	GameEngine.player.connect("player_died", self, "player_died")

func _on_LoadGame_pressed():
	pass # Replace with function body.

func _on_SaveGame_pressed():
	pass # Replace with function body.
