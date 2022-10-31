extends KinematicBody2D

export var speed = 211

export var Jump = -400

export var gravity = 11

var lastdir = 1

const UP = Vector2(0, -1)

var motion = Vector2()

var have_coyote = true

# warning-ignore:unused_argument
func _physics_process(delta):
	Animation()
	Move()
	pass
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
func Move():
# warning-ignore:standalone_expression
	motion.y += gravity
	motion.x == 0
	if Input.is_action_pressed("ui_right"):
		motion.x = speed
	elif Input.is_action_pressed("ui_left"):
		motion.x = -speed
	else:
		motion.x = 0
	if (is_on_floor() or !$coyoteTimer.is_stopped()) && (Input.is_action_just_pressed("ui_up") or !$jumpbufferTimer.is_stopped()):
			motion.y = Jump
			$jumpbufferTimer.is_stopped()
			$JumpParticles.restart()
			$coyoteTimer.stop()
	if !Input.is_action_pressed("ui_up") && motion.y < 0:
		motion.y = lerp(motion.y,0,0.2)
	if Input.is_action_just_pressed("ui_up"):
		$jumpbufferTimer.start()
		pass
		
	if !is_on_floor():
		if have_coyote:
			$coyoteTimer.start()
			have_coyote = false
	else:
		have_coyote = true
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
func Animation():
	if sign(motion.x) == 0:
		$Sprite.flip_h = lastdir == 1
		$MoveParticles.emitting = false
	
	elif sign(motion.x) == -1 :
		lastdir = -1
		$MoveParticles.emitting = true
		$Sprite.flip_h = false
	else:
		lastdir = 1
		$MoveParticles.emitting = true
		$Sprite.flip_h = true
	if motion.x != 0: $sprite.play("walk")
	else: $sprite.play("idel")
	if is_on_floor() == false:
		$sprite.play("jump")
		$MoveParticles.emitting = false
		
	
	
	pass
	motion = move_and_slide(motion, UP)
