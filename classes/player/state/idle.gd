extends NodeState

@export var player:Player

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	var direction = GameInputEvent.get_input_direction()
	player.play_anim("idle")
	player.move(direction,0)

func _on_next_transitions() -> void:
	var is_move = GameInputEvent.is_move_input()
	if is_move:
		self.transition.emit("Run")

func _on_enter() -> void:
	pass

func _on_exit() -> void:
	player.stop_anim()
