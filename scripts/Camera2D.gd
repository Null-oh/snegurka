extends Camera2D
@onready var back = $backings

func _ready(): pass
	#back.position = get_viewport().get_size() / 2

func _process(delta):
	if Global.health > 0: 
		position = position.lerp($"../snegurka".position, delta*3)
		#position = $"../snegurka".position
	#	back.position = get_viewport().get_size() / 2
