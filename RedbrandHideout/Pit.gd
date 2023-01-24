extends Thing

var found = false

func _ready():
	$Sprite.visible = found

func looked_at():
	if not found:
		if GameEngine.roll_test(GameEngine.D(20), 15):   # Should be wisdom affected
			found = true
	if found:
		found = true
		$Sprite.visible = true
		return "You see a trapped pit with a small ledge that may give access to the far side"
	else: return null

func trap_area_entered(body):
	if body is Player:
		if found:
			if body.dexterity_test(10):
				GameEngine.message("You safely walk on the ledge")
				return
			else:
				GameEngine.message("You slip off the ledge trying to cross the pit")
		else:
			found = true
			$Sprite.visible = true
			GameEngine.message("The floor falls away under you, a trap!")

		if body.dexterity_test(15):	GameEngine.message("You slip off the ledge but grab hold of the edge saving yourself")
		else: body.take_damage(GameEngine.roll(GameEngine.Dice(2, 6)))
