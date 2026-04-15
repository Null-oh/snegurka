extends AnimatedSprite2D

@export var which:String

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	match which:
		"default": self.play("default")
		"hurt": self.play("hurt")
		"death": self.play("death")
