extends Area2D
class_name CollectableComponent

@export var collect_name:String

func _ready() -> void:
	self.body_entered.connect(_on_body_entered)

func _on_body_entered(node:Node2D)->void:
	if node is Player:
		print("collect")
		get_parent().queue_free()
