extends Node
@onready var sun = $sun
@onready var back = $back
@onready var camera = $Camera2D

@onready var pause = $CanvasLayer/pause
@onready var fail = $CanvasLayer/fail
@onready var win = $CanvasLayer/win

func _ready():
	pause.hide()
	fail.hide()
	win.hide()

func _process(delta):
	if Global.paused == true:
		pause.show()
		Engine.time_scale = 0
	elif Global.paused == false:
		pause.hide()
		Engine.time_scale = 1
	
	if Global.health <= 0:
		fail.show()
		Engine.time_scale = 0
	
	if Global.won == true:
		win.show()
		Engine.time_scale = 0

func _on_pause_butt_pressed():
	Global.paused = true
