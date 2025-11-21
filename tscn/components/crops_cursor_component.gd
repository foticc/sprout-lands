extends Node2D
class_name CropsCursorComponent

@export var tilled_soil_tilemap_layer:TileMapLayer

@onready var player:Player = get_tree().get_first_node_in_group("player")

var corn_scence = preload("res://tscn/objects/plants/corn.tscn")
var tomato_scence = preload("res://tscn/objects/plants/tomato.tscn")

var cell_pos:Vector2i 
var distance:float
var source_id:int
var local_cell_pos:Vector2

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("remove_block") and ToolsManager.current_tool == DataTypes.Tools.TillGround:
		set_cell_pos()
		remove_cell()
	elif event.is_action_pressed("hit"):
		if ToolsManager.current_tool == DataTypes.Tools.PlantCorn or ToolsManager.current_tool == DataTypes.Tools.PlantTomato:
			set_cell_pos()
			add_cell()


func set_cell_pos()->void:
	var pos = get_local_mouse_position()
	self.cell_pos = tilled_soil_tilemap_layer.local_to_map(pos)
	self.source_id = tilled_soil_tilemap_layer.get_cell_source_id(cell_pos)
	self.local_cell_pos =  tilled_soil_tilemap_layer.map_to_local(cell_pos)
	self.distance = self.player.global_position.distance_to(local_cell_pos)
	print("_source_id",source_id)

func add_cell()->void:
	if self.distance <= 20 and source_id!=-1:
		var node:Node2D
		if ToolsManager.current_tool == DataTypes.Tools.PlantCorn:
			node = corn_scence.instantiate() as Node2D
		elif ToolsManager.current_tool == DataTypes.Tools.PlantTomato:
			node = tomato_scence.instantiate() as Node2D
		node.global_position = local_cell_pos
		get_parent().find_child("Crops").add_child(node)

func remove_cell()->void:
	if self.distance <= 20:
		var nodes = get_parent().find_child("Crops").get_children()
		for n:Node2D in nodes:
			if n.global_position == self.local_cell_pos:
				n.queue_free()
