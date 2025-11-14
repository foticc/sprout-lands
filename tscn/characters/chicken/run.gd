extends NodeState


@export var chicken: NonPlayableCharacter
@export var animated_sprite_2d: AnimatedSprite2D
@export var navigationagent2d: NavigationAgent2D

var speed:= 5.0

func _ready() -> void:
	navigationagent2d.velocity_computed.connect(on_safe_velocity)
	call_deferred("character_setup")

func character_setup()->void:
	await get_tree().physics_frame
	set_movement_target()

func set_movement_target()->void:
	var target_position:Vector2 = NavigationServer2D.map_get_random_point(navigationagent2d.get_navigation_map(),navigationagent2d.navigation_layers,false)
	navigationagent2d.target_position = target_position
	
func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	if navigationagent2d.is_navigation_finished():
		set_movement_target()
		chicken.current_cycle +=1
		return
	var target_position = navigationagent2d.get_next_path_position()
	var target_direction = chicken.global_position.direction_to(target_position)
	
	var v =  speed * target_direction
	if navigationagent2d.avoidance_enabled:
		navigationagent2d.velocity = v
		animated_sprite_2d.flip_h = v.x < 0
	else:
		chicken.velocity = v
		chicken.move_and_slide()

func on_safe_velocity(safe_velocity: Vector2)->void:
	#print("safe_velocity", safe_velocity)
	animated_sprite_2d.flip_h = safe_velocity.x < 0
	chicken.velocity = safe_velocity
	chicken.move_and_slide()

func _on_next_transitions() -> void:
	if chicken.current_cycle == chicken.run_cycle:
		chicken.velocity = Vector2.ZERO
		self.transition.emit("Idle")

func _on_enter() -> void:
	chicken.current_cycle = 0
	animated_sprite_2d.play("run")

func _on_exit() -> void:
	animated_sprite_2d.stop()
