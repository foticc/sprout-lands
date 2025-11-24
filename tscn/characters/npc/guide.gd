extends Node2D


var dialogue_scence = preload("res://dialogue/game_dialogue_balloon.tscn")

@onready var interactive_component: InteractiveComponent = $InteractiveComponent
@onready var interactable_label_component: Control = $InteractableLabelComponent


var is_show_pressed_key:=false

func _ready() -> void:
	interactive_component.interactive_active.connect(_on_interactive_active)
	interactive_component.interactive_deactive.connect(_on_interactive_deactive)
	interactable_label_component.hide()


func _unhandled_input(event: InputEvent) -> void:
	if is_show_pressed_key:
		if event.is_action_pressed("e"):
			var balloon:BaseGameDialogueBalloon = dialogue_scence.instantiate()
			get_tree().current_scene.add_child(balloon)
			balloon.start(load("uid://d0rslsdrie8jl"),"start")

func _on_interactive_active()->void:
	interactable_label_component.show()
	is_show_pressed_key = true

func _on_interactive_deactive()->void:
	interactable_label_component.hide()
	is_show_pressed_key = false
