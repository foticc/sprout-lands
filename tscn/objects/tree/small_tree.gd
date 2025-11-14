extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent


var log_scence = preload("res://tscn/objects/tree/log.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(_on_hurt)
	damage_component.max_damage_reached.connect(_on_max_damage_reached)

func _on_hurt(damage:int)->void:
	damage_component.apply_damage(damage)
	material.set_shader_parameter("shake_intensity",0.5)
	await get_tree().create_timer(1.0).timeout
	material.set_shader_parameter("shake_intensity",0)

func _on_max_damage_reached()->void:
	call_deferred("_add_log")
	queue_free()

func _add_log()->void:
	var log_instance = log_scence.instantiate() as Node2D
	log_instance.global_position = global_position
	get_parent().add_child(log_instance)
	
