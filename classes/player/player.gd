extends CharacterBody2D
class_name Player

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite

var direction = Vector2.ZERO

func _ready() -> void:
	pass

func _unhandled_input(_event: InputEvent) -> void:
	self.direction = GameInputEvent.get_input_direction()
	

func move(dir:Vector2,speed:float = 0)->void:
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
	self.animated_sprite.play(anim_name)

func stop_anim()->void:
	self.animated_sprite.stop()
