extends Node

signal give_some_seed
signal feed_animals

func action_give_seed()->void:
	self.give_some_seed.emit()

func action_feed_animals()->void:
	self.feed_animals.emit()
