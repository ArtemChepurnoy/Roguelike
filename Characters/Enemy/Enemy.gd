extends Character
class_name Enemy, "res://Art/v1.1 dungeon crawler 16x16 pixel pack/enemies/goblin/goblin_idle_anim_f0.png"


var path: PoolVector2Array

onready var navigatoon: Navigation2D = get_tree().current_scene.get_node("Navigation2D")
onready var player: Player = get_tree().current_scene.get_node("Player")


func chase() -> void:
	if path:
		var vector_to_next_point: Vector2 = (path[0] - global_position).normalized()
		var distance_to_next_point: float = (vector_to_next_point.length())
		if distance_to_next_point < 1:
			path.remove(0)
			if not path:
				return
		move_direction = vector_to_next_point
		
	var vector_to_next_point: Vector2 = (get_global_mouse_position() - global_position).normalized()
	if vector_to_next_point.x > 0 and AnimatedSprite.flip_h:
		AnimatedSprite.flip_h = false
	elif vector_to_next_point.x < 0 and not AnimatedSprite.flip_h:
		AnimatedSprite.flip_h = true

func _on_PathTimer_timeout():
	path = navigatoon.get_simple_path(global_position, player.position)
