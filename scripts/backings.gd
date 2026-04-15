extends Node2D
@onready var back = $back
@onready var sun = $sun

func _ready():
	back.play("default")
	sun.play("default")
	#var viewport_size = get_viewport().get_size()
	#var back_texture = back.get_animation("default").get_frame(back.animation, back.frame).texture
	#var sun_texture = sun.get_animation("default").get_frame(sun.animation, sun.frame).texture
	#back.scale = Vector2(viewport_size.x / back.texture.get_width(), viewport_size.y / back.texture.get_height())
	#sun.scale = Vector2(viewport_size.x / sun.texture.get_width(), viewport_size.y / sun.texture.get_height())

