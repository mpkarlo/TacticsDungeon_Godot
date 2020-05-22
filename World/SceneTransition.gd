extends Area2D

export(String, FILE, "*.tscn") var level_scene
export(int) var spawn_id = 0

var direction = Vector2.UP

func _on_SceneTransition_body_entered(body):
	if body is Player:
		assert(level_scene != "")
		pass # Change levels
