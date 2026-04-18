extends CanvasLayer

@onready var health_bar = $VBoxContainer/HealthBar
@onready var pause_btn = $VBoxContainer/pause_butt
@onready var pause = $pause
@onready var fail = $fail
@onready var win = $win
@onready var bonus = $VBoxContainer/bonus

func _ready():
	health_bar.value = Global.health
	pause.visible = false
	fail.visible = false
	win.visible = false
	bonus.visible = false
	bonus.value = 100
	
	Engine.time_scale = 1

func _process(delta):
	health_bar.value = Global.health
	
	if Global.health <= 0:
		failure()
	
	if Global.won:
		won()
	
	if Global.got_bonus:
		_bonus()
		Global.got_bonus = false

func _on_pause_butt_pressed():
	Engine.time_scale = 0
	pause.visible = true

func failure(): 
	Engine.time_scale = 0
	fail.visible = true

func won():
	Engine.time_scale = 0
	win.visible = true

func _bonus():
	bonus.visible = true
	var bonus_tween = create_tween()
	bonus_tween.tween_property(bonus, "value", 0, 5.0)
	await bonus_tween.finished
	bonus.visible = false
	Global.got_bonus = false
