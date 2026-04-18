extends Area2D
@onready var Sprite = $AnimatedSprite2D
@onready var sound = $idle

func ready():
	sound.play

func _process(delta):
	Sprite.play("default")
	
func _on_body_entered(body):
	if body.name == "snegurka":
		Global.won = true
