extends CanvasModulate
class_name DayNightCycleComponent

@export var initital_day:int = 1:
	set(id):
		initital_day = id
		DayAndNightCycleManager.initial_day = id
		DayAndNightCycleManager.set_initial_time()


@export var initital_hour:int = 12:
	set(ih):
		initital_hour = ih
		DayAndNightCycleManager.initial_hour = ih
		DayAndNightCycleManager.set_initial_time()

@export var initital_minute:int = 30:
	set(im):
		initital_minute = im
		DayAndNightCycleManager.initial_minute = im
		DayAndNightCycleManager.set_initial_time()
		
@export var day_night_cycle_gradient_texrute:GradientTexture1D

func _ready() -> void:
	DayAndNightCycleManager.initial_day = initital_day
	DayAndNightCycleManager.initial_hour = initital_hour
	DayAndNightCycleManager.initial_minute = initital_minute
	DayAndNightCycleManager.set_initial_time()
	DayAndNightCycleManager.game_time.connect(_on_game_time)

func _on_game_time(time:float)->void:
	var sample_value = 0.5 *(sin(time-PI * 0.5)+ 1) 
	color = day_night_cycle_gradient_texrute.gradient.sample(sample_value)
