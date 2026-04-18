extends Node
@onready var sun = $sun
@onready var back = $back
@onready var camera = $Camera2D


func _ready():
	Global.speed = 1
	Global.health = 100

func _process(delta): pass
