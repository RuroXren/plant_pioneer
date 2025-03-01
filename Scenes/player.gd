extends Node2D

func _process(delta: float) -> void:
	if Input.is_action_pressed('ui_up'):
		Move(Vector2.UP)
	elif Input.is_action_pressed('ui_right'):
		Move(Vector2.RIGHT)
	elif Input.is_action_pressed('ui_down'):
		Move(Vector2.DOWN)
	elif Input.is_action_pressed('ui_left'):
		Move(Vector2.LEFT)

func Move(direction: Vector2):
	print(direction)
