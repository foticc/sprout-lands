extends Node2D
class_name FieldCursorComponent

@export var gass_tilemap_layer:TileMapLayer
@export var tilled_soil_tilemap_layer:TileMapLayer
@export var terrain_set:int = 0 
@export var terrain:int = 1

@onready var player:Player = get_tree().get_first_node_in_group("player")

var cell_pos:Vector2i 
var distance:float
var source_id:int

func _unhandled_input(event: InputEvent) -> void:
	if ToolsManager.current_tool == DataTypes.Tools.TillGround:
		if event.is_action_pressed("remove_block"):
			set_cell_pos()
			remove_cell()
		elif event.is_action_pressed("hit"):
			set_cell_pos()
			add_cell()


func set_cell_pos()->void:
	var pos = get_local_mouse_position()
	self.cell_pos = gass_tilemap_layer.local_to_map(pos)
	self.source_id = gass_tilemap_layer.get_cell_source_id(cell_pos)
	var local_cell_pos =  gass_tilemap_layer.map_to_local(cell_pos)
	self.distance = self.player.global_position.distance_to(local_cell_pos)
	print("_source_id",source_id)

func add_cell()->void:
	if self.distance <= 20 and self.source_id!=-1:
		# 地形0中的第三个地形
		#tilled_soil_tilemap_layer.set_cells_terrain_connect([cell_pos],0,3,true)
		tilled_soil_tilemap_layer.set_cells_terrain_connect([self.cell_pos],self.terrain_set,self.terrain,true)

func remove_cell()->void:
	if self.distance <= 20 and self.source_id!=-1:
		tilled_soil_tilemap_layer.set_cells_terrain_connect([self.cell_pos],0,-1,true)
