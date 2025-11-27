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
	
	tool_axe.disabled = true
	tool_axe.focus_mode = Control.FOCUS_NONE
	tool_tilling.disabled = true
	tool_tilling.focus_mode = Control.FOCUS_NONE
	tool_watering.disabled = true
	tool_watering.focus_mode = Control.FOCUS_NONE
	tool_corn.disabled = true
	tool_corn.focus_mode = Control.FOCUS_NONE
	tool_tomato.disabled = true
	tool_tomato.focus_mode = Control.FOCUS_NONE
	GameDialogueManager.give_some_seed.connect(_on_tool_active)


func _on_tool_active()->void:
	tool_axe.disabled = false
	tool_axe.focus_mode = Control.FOCUS_CLICK
	tool_tilling.disabled = false
	tool_tilling.focus_mode = Control.FOCUS_CLICK
	tool_watering.disabled = false
	tool_watering.focus_mode = Control.FOCUS_CLICK
	tool_corn.disabled = false
	tool_corn.focus_mode = Control.FOCUS_CLICK
	tool_tomato.disabled = false
	tool_tomato.focus_mode = Control.FOCUS_CLICK

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
