extends Sprite2D

@onready var hurt_component: HurtComponent = $HurtComponent
@onready var damage_component: DamageComponent = $DamageComponent


var stone_scence = preload("res://tscn/objects/rocks/stone.tscn")

func _ready() -> void:
	hurt_component.hurt.connect(_on_hurt)
	damage_component.max_damage_reached.connect(_on_max_damage_reached)

func _on_hurt(damage:int)->void:
	damage_component.apply_damage(damage)
	material.set_shader_parameter("shake_intensity",0.5)
	await get_tree().create_timer(1.0).timeout
	material.set_shader_parameter("shake_intensity",0)

func _on_max_damage_reached()->void:
	call_deferred("_add_stone")
	queue_free()

func _add_stone()->void:
	var stone_instance = stone_scence.instantiate() as Node2D
	stone_instance.global_position = global_position
	get_parent().add_child(stone_instance)
