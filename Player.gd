extends PlayerBase
class_name Player

signal player_died

func died():
	.died()
	emit_signal("player_died")
