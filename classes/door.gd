extends StaticBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D
@onready var interactive_component: InteractiveComponent = $InteractiveComponent


func _ready() -> void:
	self.interactive_component.interactive_active.connect(_on_interactive_active)
	self.interactive_component.interactive_deactive.connect(_on_interactive_deactive)

func _on_interactive_active()->void:
	# 也可通过修改collision_layer 来修改
	#collision_layer
	collision_shape_2d.set_deferred("disabled",true)
	animated_sprite_2d.play("open_door")


func _on_interactive_deactive()->void:
	collision_shape_2d.set_deferred("disabled",false)
	animated_sprite_2d.play("close_door")
