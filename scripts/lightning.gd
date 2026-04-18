extends Area2D

@onready var sprite = $AnimatedSprite2D
@onready var area = $CollisionShape2D

func _ready():
	add_to_group("bonuses")
	sprite.play("default")

func _process(delta):
	pass

func _on_body_entered(body):
	if body.name == "snegurka":
		Global.got_bonus = true
		self.visible = false
		Global.speed = 2
		await get_tree().create_timer(5.0).timeout
		Global.speed = 1
		Global.got_bonus = false
		self.queue_free()
