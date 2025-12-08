extends CanvasLayer

@onready var save_btn: Button = $MarginContainer/VBoxContainer/SaveBtn
@onready var is_load:bool = SaveGameManager.has_archive()


func _ready() -> void:
	save_btn.pressed.connect(_on_save_btn)
	save_btn.text = "LOAD" if is_load else "SAVE"
		

func _on_save_btn()->void:
	if is_load:
		SaveGameManager.load_geme()
	else:
		SaveGameManager.save_game()
