extends NodeState

@export var player:Player

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	var direction = GameInputEvent.get_input_direction()
	player.play_anim("run")
	player.move(direction,20)

func _on_next_transitions() -> void:
	if not GameInputEvent.is_move_input():
		self.transition.emit("Idle")
		

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	player.stop_anim()
