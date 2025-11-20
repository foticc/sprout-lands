extends Node2D
class_name GrowthCycleComponent

@export var current_growth_state:DataTypes.GrowthStates = DataTypes.GrowthStates.Germination
@export_range(5,365) var days_unitls_harvest:int = 7

signal crop_maturity
signal crop_harvesting

var is_watered:bool
var starting_day:int = 0
var current_day:int

func _ready() -> void:
	DayAndNightCycleManager.time_tick_day.connect(_on_time_tick_day)



func _on_time_tick_day(day:int)->void:
	if is_watered:
		if starting_day == 0:
			starting_day = day
		growth_state(starting_day,day)
		harvest_state(starting_day,day)


func growth_state(_starting_day:int,_current_day:int)->void:
	if current_growth_state == DataTypes.GrowthStates.Maturity:
		return
	var num_state := 5
	var growth_days_passed = (_current_day-_starting_day)%num_state

	var state_index = growth_days_passed % num_state + 1
	
	current_growth_state = state_index as DataTypes.GrowthStates
	var state_name = DataTypes.GrowthStates.keys()[state_index]
	prints("name",state_name)
	if current_growth_state == DataTypes.GrowthStates.Maturity:
		crop_maturity.emit()


func harvest_state(_starting_day:int,_current_day:int)->void:
	if current_growth_state == DataTypes.GrowthStates.Harvesting:
		return
	
	var day_passed = (_current_day - _starting_day)%days_unitls_harvest
	if day_passed == (days_unitls_harvest-1):
		current_growth_state = DataTypes.GrowthStates.Harvesting
		crop_harvesting.emit()

func get_current_state()->DataTypes.GrowthStates:
	return self.current_growth_state
