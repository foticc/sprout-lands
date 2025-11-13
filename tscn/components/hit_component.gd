extends Area2D
class_name HitComponent

@export var dataTools:DataTypes.Tools = DataTypes.Tools.None
@export var hit_damage:int = 1

signal hit

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(_area: Area2D) -> void:
	self.hit.emit()
