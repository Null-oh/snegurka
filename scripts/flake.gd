extends Area2D
@onready var Sprite = $AnimatedSprite2D
@onready var idle_sound = $idle
@onready var pick_sound = $pick
@onready var done = false

func _ready():
	Sprite.play("default")

func _on_body_entered(body):
	if body.name == "snegurka":
		if not done:
			if Global.health < 90: 
				Global.health += 10
			else: 
				Global.health = 100
			pick_sound.play()
			idle_sound.stop()
			done = true
		self.visible = false
		await pick_sound.finished
		self.queue_free()
