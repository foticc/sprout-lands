extends Node

const save_game_data_path:String = "user://game_data/save_MainScene_game_data.tres"

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("save"):
		save_game()

func save_game()->void:
	var save_level_data_component:SaveLevelDataComponent = get_tree().get_first_node_in_group("save_level_data_component")
	if save_level_data_component!=null:
		save_level_data_component.save_game()

func load_geme()->void:
	var save_level_data_component:SaveLevelDataComponent = get_tree().get_first_node_in_group("save_level_data_component")
	if save_level_data_component!=null:
		save_level_data_component.load_game()

func has_archive()->bool:
	return FileAccess.file_exists(save_game_data_path)
