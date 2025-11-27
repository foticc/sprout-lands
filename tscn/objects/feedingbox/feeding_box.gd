extends Node2D

@export_enum("corn","tomato") var feed_type:String
@export_enum("start_chicken","start_cow") var dialogue_type:String
@export var out_radius:float
@export var out_scence:Array[PackedScene] = []

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var interactive_component: InteractiveComponent = $InteractiveComponent
@onready var interactable_label_component: Control = $InteractableLabelComponent
@onready var feed_component: FeedComponent = $FeedComponent
@onready var marker_2d: Marker2D = $Marker2D

const dialogue_scene = preload("res://dialogue/game_dialogue_balloon.tscn")

const TOMATO_FRUIT = preload("uid://bpuif0rbcy158")
const CORN_FRUIT = preload("uid://b6xbu3pwjdcr8")


var box_is_open:=false
var is_in_range:=false


func _ready() -> void:
	self.interactable_label_component.hide()
	self.interactive_component.interactive_active.connect(_on_open)
	self.interactive_component.interactive_deactive.connect(_on_close)
	self.feed_component.food_revied.connect(_on_food_revied)
	
	GameDialogueManager.feed_animals.connect(_on_feed_animals)


func _unhandled_input(event: InputEvent) -> void:
	if is_in_range and event.is_action_pressed("e"):
		animated_sprite_2d.play("open")
		var dia:BaseGameDialogueBalloon =  dialogue_scene.instantiate()
		get_tree().current_scene.add_child(dia)
		dia.start(load("res://dialogue/conversation/feedbox.dialogue"),dialogue_type)
		box_is_open = true

func _on_open()->void:
	interactable_label_component.show()
	self.is_in_range = true

func _on_close()->void:
	interactable_label_component.hide()
	if box_is_open:
		animated_sprite_2d.play("close")
	self.box_is_open = false
	self.is_in_range = false

func _on_feed_animals()->void:
	if is_in_range:
		if feed_type == "corn":
			tigger_feed_animals("corn",CORN_FRUIT)
		elif feed_type == "tomato":
			tigger_feed_animals("tomato",TOMATO_FRUIT)

func tigger_feed_animals(item:String,scene:Resource)->void:
	if not InventoryManager.has_item(item):
		ToastManager.show("没有需要得物品唉😅")
		return

	var instance = scene.instantiate()
	instance.global_position = Vector2(global_position.x,global_position.y-50)
	get_tree().root.add_child(instance)
	
	var time_delay = randf_range(0.5,1)
	await get_tree().create_timer(time_delay).timeout
	
	var tween = get_tree().create_tween()
	tween.tween_property(instance,"position",self.global_position,1.0)
	tween.tween_property(instance,"scale",Vector2(0.5,0.5),1.0)
	tween.tween_callback(instance.queue_free)
	# bug 当实例化出玉米或者番茄对象时，由于玉米或者番茄对象 也是可收集的，当它当好碰到人物的碰撞层时，
	# 被人物收集到了，导致现象是  玉米的数量-1 后又+1
	InventoryManager.remove_item(item)

func _on_food_revied(_area:Area2D)->void:
	call_deferred("add_scence")

func add_scence()->void:
	var pos = get_random_position_in_circle(self.marker_2d.global_position,out_radius)
	for oscens in out_scence:
		var instance = oscens.instantiate() as Node2D
		instance.global_position = pos
		get_tree().root.add_child(instance)
	


func get_random_position_in_circle(center:Vector2,radius:float)->Vector2i:
	var angle = randf() * TAU
	var distance_from_center = sqrt(randf()) * radius
	
	var x:int = center.x + distance_from_center * cos(angle)
	var y:int = center.y + distance_from_center * cos(angle)
	return Vector2i(x,y)
