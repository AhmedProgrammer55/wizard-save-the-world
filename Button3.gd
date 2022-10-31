extends Button

func _physics_process(delta):
	if Input.is_action_pressed("ui_up"):
		$B3.play("press")
		pass
	else:
		$B3.play("reles")
		pass
	pass
