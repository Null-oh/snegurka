extends Control

func _on_resume_pressed():
	Global.paused = false


func _on_exit_pressed():
	get_tree().change_scene_to_file("res://assets/menu.tscn")
