extends PanelContainer

@onready var logs_label: Label = $MarginContainer/VBoxContainer/Logs/LogsLabel
@onready var stone_label: Label = $MarginContainer/VBoxContainer/Stone/StoneLabel
@onready var corn_label: Label = $MarginContainer/VBoxContainer/Corn/CornLabel
@onready var tomato_label: Label = $MarginContainer/VBoxContainer/Tomato/TomatoLabel
@onready var egg_label: Label = $MarginContainer/VBoxContainer/Egg/EggLabel
@onready var milk_label: Label = $MarginContainer/VBoxContainer/Milk/MilkLabel

func _ready() -> void:
	InventoryManager.inventory_changed.connect(_on_inventory_changed)


func _on_inventory_changed(item:String)->void:
	match item:
		"logs":
			logs_label.text = str(InventoryManager.inventory.get(item))
		"stone":
			stone_label.text = str(InventoryManager.inventory.get(item))
		"corn":
			corn_label.text = str(InventoryManager.inventory.get(item))
		"tomato":
			tomato_label.text = str(InventoryManager.inventory.get(item))
		"egg":
			egg_label.text = str(InventoryManager.inventory.get(item))
		"milk":
			milk_label.text = str(InventoryManager.inventory.get(item))
