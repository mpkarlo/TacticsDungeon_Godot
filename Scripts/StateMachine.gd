extends Node
class_name StateMachine

onready var parent = get_parent()

var curr_state = null setget set_state
var last_state = null
var states = {}

func _physics_process(delta):
	if curr_state != null:
		_state_logic(delta)
		var transition = _get_transition(delta)

		if transition != null:
			set_state(transition)
		else:
			pass

	else:
		pass

func _state_logic(delta):
	pass

func _get_transition(delta):
	return null

func _enter_state(new_state, old_state):
	pass

func _exit_state(old_state, new_state):
	pass

func set_state(new_state):
	last_state = curr_state
	curr_state = new_state

	if last_state != null:
		_exit_state(last_state, new_state)
	else:
		pass

	if new_state != null:
		_enter_state(new_state, last_state)
	else:
		pass

func add_state(state_name):
	states[state_name] = states.size()
