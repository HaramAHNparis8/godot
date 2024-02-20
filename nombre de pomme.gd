extends CanvasLayer
var faux_apple = 0
var Apple = 0
func _ready():
	$apple.text = String(Apple)
	$"faux pomme 4".text = String(faux_apple)

#func _on__apple_appele_collected():
	#Apple = Apple + 1
	#_ready()
func _physics_process(delta):
	if Apple == 3:
		get_tree().change_scene("res://level2.tscn")
	elif faux_apple == 3:
		get_tree().change_scene("res://gameover.tscn")
	

func _on__appele_collected():
	Apple = Apple + 1
	_ready()


func _on_apple_faux_appele_collected():
	faux_apple = faux_apple + 1
	_ready()
