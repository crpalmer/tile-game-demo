extends Conversation

var last_was_name = false

func name(): return "New Guy"

func hello(): return "Hello.  You found me!"

func player_said(text:String, words:Array):
	if (last_was_name and words.size() == 1 and words[0] == "why") or ("new" in words and "guy" in words):
		say("Yeah, it's a strange name.  My mother wasn't very creative...")
	elif "name" in words:
		say("I'm called New Guy")
		last_was_name = true
	elif "who" in words and "are" in words and "you" in words:
		say("Some guy sitting in the dungeon.")
	else:
		.player_said(text, words)
