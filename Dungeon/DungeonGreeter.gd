extends ConversationalActor

var player_name
var wants_to_talk = true

func get_persistent_data():
	var p = .get_persistent_data()
	p.merge({ "player_name": player_name})
	return p

func load_persistent_data(p):
	.load_persistent_data(p)
	player_name = p.player_name

func wants_to_initiate_conversation():
	return wants_to_talk

func start():
	wants_to_talk = false
	.start()

func say_hello():
	say(hello())

func hello():
	if player_name: return "Hi " + player_name
	else: return "Hi my name is " + name() + ".  Who are you?"

func player_said(said:String, words:Array):
	if not player_name:
		player_name = said
		say("Hi " + player_name + ".  Did you know that I've been trapped in this dungeon for years and years?  There's been so many things come in here but no one ever leaves.\n\nWhat can I do for you?")
	else:
		player_said_something(said, words)

func player_said_something(said:String, words:Array):
	if "quest" in words or "quests" in words:
		say_in_parts(["I don't know about any quests.  Ask at the temple.", "They are always sending people off to strange places"])
	elif "bribe" in words:
		end("I'm offended")
	elif "strange" in words and "places" in words:
		say("I hear that the temple even sent one person to Canada!!!")
	else:
		.player_said(said, words)
