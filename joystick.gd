extends CanvasLayer

func _on_right_button_down():
	Input.action_press("ui_right")

func _on_right_button_up():
	Input.action_release("ui_right")

func _on_left_button_down():
	Input.action_press("ui_left")

func _on_left_button_up():
	Input.action_release("ui_left")

func _on_space_button_down():
	Input.action_press("ui_accept")

func _on_space_button_up():
	Input.action_release("ui_accept")
