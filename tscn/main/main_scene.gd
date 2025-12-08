extends Node2D

@onready var game_menu_scene: CanvasLayer = $GameMenuScene

func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("esc"):
		on_esc()

func on_esc()->void:
	game_menu_scene.visible = !game_menu_scene.visible
