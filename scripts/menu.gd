extends Node

func _ready():
	Global.health = 100
	Global.paused = false
	Global.won = false

func _on_play_pressed():
	get_tree().change_scene_to_file("res://assets/level.tscn")

func _on_exit_pressed(): get_tree().quit()
