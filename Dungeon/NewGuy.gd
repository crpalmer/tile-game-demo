extends ConversationalActor

var last_was_name = false

func say_hello():
	say("Hello.  You found me!")

func start():
	last_was_name = false
	.start()
	
func player_said(text:String, words:Array):
	if (last_was_name and words.size() == 1 and words[0] == "why") or ("new" in words and "guy" in words):
		say("Yeah, it's a strange name.  My mother wasn't very creative...")
	elif "name" in words:
		say("I'm called " + name())
		last_was_name = true
		return
	elif "who" in words and "are" in words and "you" in words:
		say("Some guy sitting in the dungeon.")
	else:
		.player_said(text, words)
	last_was_name = false
