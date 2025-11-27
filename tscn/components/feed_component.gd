extends Area2D
class_name FeedComponent

signal food_revied(area:Area2D)

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area:Area2D)->void:
	self.food_revied.emit(area)
