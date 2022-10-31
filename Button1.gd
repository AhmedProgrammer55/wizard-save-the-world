extends Button

func _physics_process(delta):
	if Input.is_action_pressed("ui_left"):
		$B1.play("press")
		pass
	else:
		$B1.play("reles")
		pass
	pass
