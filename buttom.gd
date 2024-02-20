extends Control



func _on_start_pressed():
	get_tree().change_scene("res://intro1.tscn")


func _on_TextureButton3_pressed():
	get_tree().quit()



