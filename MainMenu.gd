extends Node2D

func _ready():
	GameEngine.modulate.visible = false
	$SaveGame.visible = false
	
func _on_NewGame_pressed():
	GameEngine.modulate.visible = true
	GameEngine.new_game("res://Dungeon/Dungeon.tscn", "entrance")

func _on_LoadGame_pressed():
	pass # Replace with function body.

func _on_SaveGame_pressed():
	pass # Replace with function body.
