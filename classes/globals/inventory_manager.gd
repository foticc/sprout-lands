extends Node

var inventory:Dictionary = Dictionary()

signal inventory_changed(item:String)

func add_item(item:String)->void:
	if inventory.has(item):
		inventory[item] +=1
	else:
		inventory.set(item,1)
	inventory_changed.emit(item)
