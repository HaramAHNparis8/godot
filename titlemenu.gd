extends Control


func _ready():
	pass
	
func _process(delta):
	if $AudioStreamPlayer.playing == false:
		$AudiostreamPlayer.play()
