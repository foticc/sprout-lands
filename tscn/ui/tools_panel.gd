extends PanelContainer

@onready var tool_axe: Button = $MarginContainer/HBoxContainer/ToolAxe
@onready var tool_tilling: Button = $MarginContainer/HBoxContainer/ToolTilling
@onready var tool_watering: Button = $MarginContainer/HBoxContainer/ToolWatering
@onready var tool_corn: Button = $MarginContainer/HBoxContainer/ToolCorn
@onready var tool_tomato: Button = $MarginContainer/HBoxContainer/ToolTomato

func _ready() -> void:
	tool_axe.pressed.connect(_on_tool_axe)
	tool_tilling.pressed.connect(_on_tool_tilling)
	tool_watering.pressed.connect(_on_tool_watering)
	tool_corn.pressed.connect(_on_tool_corn)
	tool_tomato.pressed.connect(_on_tool_tomato)

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("release"):
		ToolsManager.select_tool(DataTypes.Tools.None)
		tool_axe.release_focus()
		tool_tilling.release_focus()
		tool_watering.release_focus()
		tool_corn.release_focus()
		tool_tomato.release_focus()

func _on_tool_axe()->void:
	ToolsManager.select_tool(DataTypes.Tools.AxeWood)
func _on_tool_tilling()->void:
	ToolsManager.select_tool(DataTypes.Tools.TillGround)
func _on_tool_watering()->void:
	ToolsManager.select_tool(DataTypes.Tools.WaterCrops)
func _on_tool_corn()->void:
	ToolsManager.select_tool(DataTypes.Tools.PlantCorn)
func _on_tool_tomato()->void:
	ToolsManager.select_tool(DataTypes.Tools.PlantTomato)
