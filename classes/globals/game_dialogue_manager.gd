extends Node

signal give_some_seed
signal feed_animals

func action_give_seed()->void:
	InventoryManager.add_item("corn")
	InventoryManager.add_item("tomato")
	self.give_some_seed.emit()

func action_feed_animals()->void:
	self.feed_animals.emit()
