extends CanvasLayer

export(String, FILE, "*.tscn") var nextScene

func _on_Button_pressed():
	get_tree().change_scene(nextScene)
