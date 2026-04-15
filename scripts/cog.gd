extends Area2D
@onready var Sprite = $AnimatedSprite2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	Sprite.play("default")


func _on_body_entered(body):
	if body.name == "snegurka":
		Global.won = true
