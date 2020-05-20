extends Character
class_name Player

const BASE_M0VE_SPEED = 6 * 16

var move_direction = Vector2.ZERO
var desired_velocity = Vector2.ZERO
var is_attacking = false
var is_alive = true
var has_control = true

func _physics_process(delta):
	if is_alive && has_control:
		_handle_move_input()
		_update_facing()
#		_move_weapon()
		_apply_movement()

func _handle_move_input():
	var move_direction = Vector2()
	move_direction.x = -int(Input.is_action_pressed("move_left")) + int(Input.is_action_pressed("move_right"))
	move_direction.y = -int(Input.is_action_pressed("move_up")) + int(Input.is_action_pressed("move_down"))
	velocity = move_direction.normalized() * BASE_M0VE_SPEED

func _apply_movement():
	velocity = velocity.linear_interpolate(velocity, 0.3)
	velocity = move_and_slide(velocity)
