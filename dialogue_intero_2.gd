extends Control

var dialog = [
	"alex: ça fait longtemps..","damien: …", "alex:pourquoi tu nous part?",
	"damien:Avec ma faille et ici, j'ai toujours l'impression d'être étranger..",
	"alex:mais c'est pareil partout","damien: tu ne sais rien en tantque gens qui sont différent avec d'autre personne",
	"damien: tout le monde me prend pour un monstre parce que j'ai des  aile","j'ai trouvé qu'il y a les gens qui me remsble. Laisse-moi rester avec eux",
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	
func _physics_process(delta):
	$indicateur.visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
	
func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1,1,
			Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		 )
		$Tween.start()
	else:
		queue_free()
	dialog_index += 1
	
		

#func _on_Tween_tween_completed(object, key):
	#finished = true 
