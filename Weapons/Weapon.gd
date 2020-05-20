extends Node2D
class_name Weapon

signal attack_finished()

export(float) var held_distance = 12
export(float) var attack_range = 16 / 2
export(float) var attack_duration = 0.1

onready var body = $Body

var is_attacking = false

func move_weapon(direction):
	scale.x = direction

func attack() -> bool:
	assert(false)
	return false

func _attack_complete():
	is_attacking = false
	emit_signal("attack_finished")

