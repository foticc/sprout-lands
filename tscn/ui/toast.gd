extends CanvasLayer
class_name Toast
@onready var label: Label = $Label


func show_text(text:String)->void:
	self.label.text = text
	
	await get_tree().create_timer(1.0).timeout
	var tween = create_tween()
	tween.tween_property(label, "modulate:a", 0.0, 0.5)
	tween.tween_callback(queue_free)
	call_deferred("queue_free")
