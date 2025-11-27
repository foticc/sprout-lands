extends Node

const TOAST = preload("uid://p6cwx2alk3rf")

func show(text:String)->void:
	var instance = TOAST.instantiate() as Toast
	get_tree().root.add_child(instance)
	instance.show_text(text)
