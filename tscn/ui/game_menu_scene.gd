extends CanvasLayer

@onready var save_btn: Button = $MarginContainer/VBoxContainer/SaveBtn

func _ready() -> void:
	save_btn.pressed.connect(_on_save_btn)

func _on_save_btn()->void:
	SaveGameManager.save_game()
