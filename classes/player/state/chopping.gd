extends NodeState


@export var player:Player


func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	if !player.animated_sprite.is_playing():
		self.transition.emit("Idle")

func _on_enter() -> void:
	player.play_anim("chopping")

func _on_exit() -> void:
	player.stop_anim()
