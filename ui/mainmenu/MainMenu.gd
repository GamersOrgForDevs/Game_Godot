extends MarginContainer


func _on_Button_pressed(extra_arg_0):
	if extra_arg_0 == "Continue":
		get_tree().change_scene_to_file("res://levels/game_level.tscn")
	elif extra_arg_0 == "ExitGame":
		get_tree().quit()
	elif extra_arg_0 == "NewGame":
		get_tree().change_scene_to_file("res://levels/night_level.tscn")

