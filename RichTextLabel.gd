extends RichTextLabel


var dialogue = [
	"I'm on making a game", "i have my life"]
var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
func load_dialog():
	if dialog_index < dialo.size():
		$RichTextlable
