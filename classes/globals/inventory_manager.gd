extends Node

var inventory:Dictionary = Dictionary()

signal inventory_changed(item:String)

func add_item(item:String)->void:
	if inventory.has(item):
		inventory[item] +=1
	else:
		inventory.set(item,1)
	inventory_changed.emit(item)

func has_item(item:String) -> bool:
	return inventory.has(item)

func remove_item(item:String,count:int = 1)->void:
	if inventory.has(item):
		inventory[item] = maxi(inventory.get(item)-count,0)
		inventory_changed.emit(item)
