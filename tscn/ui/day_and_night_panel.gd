extends Control


@export var normal_speed:int = 5
@export var double_speed:int = 10
@export var multi_speed:int = 100



@onready var day_label: Label = $DayPanel/MarginContainer/DayLabel
@onready var time_label: Label = $TimePanel/MarginContainer/TimeLabel
@onready var normal_btn: Button = $Control/NormalBtn
@onready var double_btn: Button = $Control/DoubleBtn
@onready var multi_btn: Button = $Control/MultiBtn

func _ready() -> void:
	DayAndNightCycleManager.time_tick.connect(_on_time_tick)
	self.normal_btn.pressed.connect(_on_btn_pressed.bind(normal_speed))
	self.double_btn.pressed.connect(_on_btn_pressed.bind(double_speed))
	self.multi_btn.pressed.connect(_on_btn_pressed.bind(multi_speed))

func _on_time_tick(day:int,hour:int,minute:int)->void:
	self.day_label.text = "DAY " + str(day)
	self.time_label.text = "%02d:%02d" % [hour,minute]

func _on_btn_pressed(speed:int)->void:
	DayAndNightCycleManager.game_speed = speed
