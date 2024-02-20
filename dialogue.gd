extends Control


var dialogue = [
	"I'm on making a game", "i have my life"
	]
var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	
func _process(delta):
		load_dialog()
	
func load_dialog():
	if dialog_index < dialogue.size():
		$RichTextLabel.bbcode_text = dialogue[dialog_index]
	dialog_index +=1

