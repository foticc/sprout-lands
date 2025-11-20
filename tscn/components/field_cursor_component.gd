extends Node2D
class_name FieldCursorComponent

@export var gass_tilemap_layer:TileMapLayer
@export var tilled_soil_tilemap_layer:TileMapLayer
@export var terrain_set:int = 0 
@export var terrain:int = 1



func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
		var pos = get_global_mouse_position()
		var cell_id = gass_tilemap_layer.get_cell_source_id(pos)
		print("cell_id",cell_id)
