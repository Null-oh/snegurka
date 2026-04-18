extends AnimatedSprite2D

@export var which:String

func _process(delta):
	match which:
		"default": self.play("default")
		"hurt": self.play("hurt")
		"death": self.play("death")
