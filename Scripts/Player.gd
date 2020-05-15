extends KinematicBody2D

const BASE_M0VE_SPEED = 6 * 16

onready var body = $PlayerBody

var velocity = Vector2()
var is_alive = true
var has_control = true

func _physics_process(delta):
	if is_alive && has_control:
		_handle_move_input()
		_update_facing()
		_apply_movement()

func _handle_move_input():
	var move_direction = Vector2()
	move_direction.x = -int(Input.is_action_pressed("move_left")) + int(Input.is_action_pressed("move_right"))
	move_direction.y = -int(Input.is_action_pressed("move_up")) + int(Input.is_action_pressed("move_down"))
	velocity = move_direction.normalized() * BASE_M0VE_SPEED

func _update_facing():
	var direction = sign(get_local_mouse_position().x)
	if direction != 0:
		body.scale.x = direction

func _apply_movement():
	velocity = velocity.linear_interpolate(velocity, 0.3)
	velocity = move_and_slide(velocity)
