extends Area2D
class_name FeedComponent
# "信号是用来对行为做出反应的，而不是用来引发行为的。不建议这样使用"
signal food_revied(area:Area2D)

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area:Area2D)->void:
	self.food_revied.emit(area)
