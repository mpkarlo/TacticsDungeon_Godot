extends Weapon
class_name Sword

func _ready():
	pass

func attack() -> bool:
	if !is_attacking:
		is_attacking = true
		# do anim
		# activate hurtbox
		# play sounds
		return true
	else:
		return false

func _attack_complete():
	# deactivate hurtbox
	._attack_complete()

