extends Button

func _physics_process(delta):
	if Input.is_action_pressed("ui_right"):
		$B2.play("press")
		pass
	else:
		$B2.play("reles")
		pass
	pass
