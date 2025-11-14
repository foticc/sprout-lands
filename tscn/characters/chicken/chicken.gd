extends NonPlayableCharacter

func _ready() -> void:
	self.run_cycle = randi_range(min_cycle,max_cycle)
