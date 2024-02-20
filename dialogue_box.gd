extends Control

var dialog = ["la journée où mon frère a survolé, je pars de ma maison.",
"après avoir été accepté par l'université de séoul, j'oublie presque mon frère…","je n'ai pas le temps de souvenir mon frère avec la vie de séoul. Il faut survivre avec une fausse compétition.."
,"je penais, je pourrais réussir à oublier mon frère avant de rencontrer mon frère disparu quand je reviens  ville natale par l'harsard."

]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()
	
func _process(delta):
	$ "fliche".visible = finished
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()
func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible",0,1,1,
			Tween.TRANS_LINEAR,Tween.EASE_IN_OUT
		)
		$Tween.start()
	dialog_index += 1
		


func _on_Tween_tween_completed(object, key):
	finished = true
