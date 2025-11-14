extends NodeState

@export var chicken: NonPlayableCharacter
@export var animated_sprite_2d: AnimatedSprite2D

@onready var timer:Timer = Timer.new()

var is_idle:bool = true

func _ready() -> void:
	timer.wait_time = 2
	timer.timeout.connect(_on_timer_time_out)
	add_child(timer)

func _on_process(_delta : float) -> void:
	pass

func _on_physics_process(_delta : float) -> void:
	pass

func _on_next_transitions() -> void:
	if not is_idle:
		self.transition.emit("Run")

func _on_enter() -> void:
	is_idle = true
	animated_sprite_2d.play("idle")
	timer.start()

func _on_exit() -> void:
	animated_sprite_2d.stop()
	timer.stop()

func _on_timer_time_out()->void:
	is_idle = false
