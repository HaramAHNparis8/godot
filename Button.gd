extends Button


func _on_Button_pressed():
	get_tree().change_scene("res://intro1.tscn")


func _on_Main_menu_pressed():
	get_tree().change_scene("res://titlemenu.tscn")
