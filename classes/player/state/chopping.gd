extends NodeState


@export var player:Player
@export var hit_collision_shape:CollisionShape2D


func _ready() -> void:
	hit_collision_shape.set_deferred("disabled",true)
	hit_collision_shape.position = Vector2.ZERO

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	if !player.animated_sprite.is_playing():
		self.transition.emit("Idle")

func _on_enter() -> void:
	player.play_anim("chopping")
	match player.direction:
		Vector2.UP:
			hit_collision_shape.position = Vector2(0,-18)
		Vector2.DOWN:
			hit_collision_shape.position = Vector2(0,3)
		Vector2.LEFT:
			hit_collision_shape.position = Vector2(-9,0)
		Vector2.RIGHT:
			hit_collision_shape.position = Vector2(9,0)
	hit_collision_shape.set_deferred("disabled",false)

func _on_exit() -> void:
	player.stop_anim()
	hit_collision_shape.set_deferred("disabled",true)
