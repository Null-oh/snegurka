extends ProgressBar

func _ready():
	self.value = Global.health

func _process(delta):
	self.value = Global.health
