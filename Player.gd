extends PlayerBase
class_name Player

func died():
	.died()
	GameEngine.clear_game()
	GameEngine.enter_scene("res://Menu.tscn", "")
