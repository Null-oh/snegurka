extends Area2D
@onready var Sprite = $AnimatedSprite2D

func _ready():
	Sprite.play("default")

func _on_body_entered(body):
	if body.name == "snegurka":
		if Global.health <90: Global.health += 10
		else: Global.health = 100
		self.queue_free()
