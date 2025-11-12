extends Area2D
class_name InteractiveComponent

signal interactive_active

signal interactive_deactive



func _on_body_entered(_body: Node2D) -> void:
	self.interactive_active.emit()


func _on_body_exited(_body: Node2D) -> void:
	self.interactive_deactive.emit()
