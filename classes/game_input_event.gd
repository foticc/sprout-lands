class_name GameInputEvent


static var direction = Vector2.ZERO

static func get_input_direction() -> Vector2:
	if Input.is_action_pressed("top"):
		direction = Vector2.UP
	elif Input.is_action_pressed("bottom"):
		direction = Vector2.DOWN
	elif Input.is_action_pressed("left"):
		direction = Vector2.LEFT
	elif Input.is_action_pressed("right"):
		direction = Vector2.RIGHT
	else:
		direction = Vector2.ZERO
	
	return direction

static func is_move_input()->bool:
	return direction != Vector2.ZERO
