extends Enemy
class_name FlyingCreature, "res://Art/v1.1 dungeon crawler 16x16 pixel pack/enemies/flying creature/fly_anim_f0.png"


onready var hitbox = get_node("Hitbox")

func _process(delta):
	hitbox.knockback_direction = move_direction
	
	
