extends Control

func _on_button_pressed():
	Global.health = 100
	#Global.paused = false
	get_tree().change_scene_to_file("res://assets/level.tscn")

func _on_exit_pressed():
	Global.health = 100
	#Global.paused = false
	get_tree().change_scene_to_file("res://assets/menu.tscn")
