extends Node2D

@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var watering_particles: GPUParticles2D = $WateringParticles
@onready var flowering_particles: GPUParticles2D = $FloweringParticles
@onready var growth_cycle_component: GrowthCycleComponent = $GrowthCycleComponent
@onready var hurt_component: HurtComponent = $HurtComponent

var corn_scence = preload("res://tscn/objects/collectable/corn_fruit.tscn")

var growth_state:DataTypes.GrowthStates = DataTypes.GrowthStates.Seed

func _ready() -> void:
	watering_particles.emitting = false
	flowering_particles.emitting = false
	
	growth_cycle_component.crop_maturity.connect(_on_crop_maturity)
	growth_cycle_component.crop_harvesting.connect(_on_crop_harvesting)
	
	hurt_component.hurt.connect(_on_hurt)

func _process(_delta: float) -> void:
	growth_state = growth_cycle_component.get_current_state()
	sprite_2d.frame = growth_state
	
	if growth_state == DataTypes.GrowthStates.Maturity:
		flowering_particles.emitting = true

func _on_crop_maturity()->void:
	flowering_particles.emitting = true
		

func _on_crop_harvesting()->void:
	var corn_instance = corn_scence.instantiate() as Node2D
	corn_instance.global_position = global_position
	get_parent().add_child(corn_instance)
	queue_free()

func _on_hurt(_damage:int)->void:
	if !growth_cycle_component.is_watered:
		watering_particles.emitting = true
		await get_tree().create_timer(5.0).timeout
		watering_particles.emitting = false
		growth_cycle_component.is_watered = true
