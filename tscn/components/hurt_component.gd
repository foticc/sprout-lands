extends Area2D
class_name HurtComponent

@export var dataTools:DataTypes.Tools = DataTypes.Tools.None

signal hurt(damage:int)

func _ready() -> void:
	self.area_entered.connect(_on_area_entered)

func _on_area_entered(area: Area2D) -> void:
	var hit  = area as HitComponent
	if dataTools == hit.dataTools:
		hurt.emit(hit.hit_damage)
