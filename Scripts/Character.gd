extends KinematicBody2D
class_name Character

signal damaged(amount)
signal health_updated(health)
signal killed()

export(float) var max_health = 100
export(float) var max_action_points = 100
export(float) var move_speed_units = 2
export(float) var move_weight = 0.1

onready var state_machine = $StateMachine
onready var body = $Body

onready var move_speed = move_speed_units * 16
onready var health = max_health setget _set_health

var velocity = Vector2.ZERO
var weapon = null

func _ready():
	pass

func _apply_movement():
	velocity = move_and_slide(velocity)

func apply_damage(amount):
	return amount

func perform_attack():
	if weapon != null:
		weapon.attack()

func kill():
	emit_signal("killed")
	queue_free()

func _update_facing():
	if velocity.x < 0: # TODO: Test this code. Make sure characters face the right direction.
		body.get_node("Sprite").flip_h

func is_attacking():
	if weapon != null:
		return weapon.is_attacking
	else:
		return false

func _set_move_speed_units(value):
	move_speed = value * 16
	move_speed_units = value

func _set_move_speed(value):
	move_speed = value
	move_speed_units = value / 16

func _set_health(value):
	health = clamp(value, 0, max_health)
	emit_signal("health_updated", health)

	if health == 0:
		kill()

#func _set_weapon(value: Weapon):
#	weapon = value
#	weapon.aim_at_target(Vector2.RIGHT)
