extends Panel

@onready var animated_sprite_2d: AnimatedSprite2D = $Emote/AnimatedSprite2D

func _ready() -> void:
	InventoryManager.inventory_changed.connect(_on_inventory_changed)
	GameDialogueManager.feed_animals.connect(_on_feed_animals)

func _on_inventory_changed(_item:String)->void:
	animated_sprite_2d.play("excited")
	await animated_sprite_2d.animation_finished
	animated_sprite_2d.play("default")

func _on_feed_animals()->void:
	animated_sprite_2d.play("emo_ovo")
	await animated_sprite_2d.animation_finished
	animated_sprite_2d.play("default")
