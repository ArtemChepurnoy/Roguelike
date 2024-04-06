extends KinematicBody2D
class_name Character, "res://Art/v1.1 dungeon crawler 16x16 pixel pack/heroes/knight/knight_idle_anim_f0.png"

onready var animated_sprite: AnimatedSprite = get_node("AnimatedSprite")
onready var state_machine: Node = get_node("FiniteStateMachine")

const FRICTION: float = 0.1

export(int) var hp: int = 2 setget set_hp
signal hp_changed(new_hp)

var move_direction: Vector2 = Vector2.ZERO
var velocity: Vector2 = Vector2.ZERO
var acceleration: int = 40
var max_speed: int = 40

func move() -> void:
	move_direction = move_direction.normalized()
	velocity += move_direction * acceleration
	velocity = velocity.limit_length(max_speed)
	
func _physics_process(delta: float) -> void:
	velocity = move_and_slide(velocity)
	velocity = lerp(velocity, Vector2.ZERO, FRICTION)

func take_damage(dam: int, dir: Vector2, force: int) -> void:
	self.hp -= dam
	if hp > 0:
		state_machine.set_state(state_machine.states.hurt)
		velocity += dir * force
	else:
		state_machine.set_state(state_machine.states.dead)
		velocity += dir * force * 2
		
		
func set_hp(new_hp: int) -> void:
	hp = new_hp
	emit_signal("hp_changed", new_hp)

	
