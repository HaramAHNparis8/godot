extends CanvasLayer

var appele2 = 0


func _ready():
	$appele2.text = String(appele2)
	

func _physics_process(delta):
	if appele2 == 18:
		get_tree().change_scene("res://Control.tscn")
	

func _on_appele2_collected():
	appele2 = appele2 + 1
	_ready()
