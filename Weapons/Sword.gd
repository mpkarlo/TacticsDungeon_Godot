extends Weapon
class_name Sword

onready var attack_tween = $AttackTween

func _ready():
	hurtbox = $Body/Hurtbox
	hurtbox.add_faction_exception(get_parent().faction)
	hurtbox.monitoring = false

func attack() -> bool:
	if !is_attacking:
		is_attacking = true
		attack_tween.interpolate_property(body, "position:x", body.position.x, attack_range, attack_duration, Tween.TRANS_EXPO, Tween.EASE_OUT)
		attack_tween.interpolate_property(body, "position:x", attack_range, body.position.x, attack_duration, Tween.TRANS_CIRC, Tween.EASE_IN, attack_duration)
		attack_tween.interpolate_callback(self, attack_duration * 2, "_attack_complete")
		attack_tween.start()
		hurtbox.monitoring = true
		$AttackSFX.play()
		return true
	else:
		return false

func _attack_complete():
	# deactivate hurtbox
	._attack_complete()

