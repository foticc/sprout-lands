extends CharacterBody2D
class_name Player


@export var tools:DataTypes.Tools = DataTypes.Tools.None

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite
@onready var hit_component: HitComponent = $HitComponent

var direction = Vector2.DOWN

func _ready() -> void:
	ToolsManager.tool_change.connect(_on_tool_change)


func move(dir:Vector2,speed:float = 0)->void:
	if dir != Vector2.ZERO:
		self.direction = dir
	velocity = speed * dir
	move_and_slide()

func play_anim(anim:String)->void:
	var anim_name = anim + "_"
	match self.direction:
		Vector2.UP:
			anim_name += "back"
		Vector2.DOWN:
			anim_name += "front"
		Vector2.LEFT:
			anim_name += "left"
		Vector2.RIGHT:
			anim_name += "right"
		_:
			return
	#print(anim_name)
	self.animated_sprite.play(anim_name)

func stop_anim()->void:
	self.animated_sprite.stop()


func _on_tool_change(tool:DataTypes.Tools)->void:
	self.tools = tool
	self.hit_component.dataTools = tool
