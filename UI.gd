extends CanvasLayer

const MIN_HP: int = 23
var max_hp: int = 4

onready var player: KinematicBody2D = get_parent().get_node("Player")
onready var health_bar: TextureProgress = get_node("HealthBar")
onready var tween: Tween = get_node("HealthBar/Tween")


func _ready() -> void:
	max_hp = player.hp
	


func _on_Player_hp_changed(new_hp):
	var new_value: float = (new_hp * (100 - MIN_HP) / max_hp) + MIN_HP
	change_hp(new_value)
	
	
	
func change_hp(value: float) -> void:
	var __ = tween.interpolate_property(health_bar, "value", health_bar.value, value, 0.5, Tween.TRANS_QUINT, Tween.EASE_OUT)
	tween.start()
	
