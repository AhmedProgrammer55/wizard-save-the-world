extends CanvasLayer

func _ready():
	pass
	
func _input(event):
	if event.is_action_pressed("pause"):
		$Label.visible = !$Label.visible
		$continue.visible = !$continue.visible
		$exit.visible = !$exit.visible
		$TextureRect.visible = !$TextureRect.visible
		get_tree().paused = !get_tree().paused


func _on_continue_pressed():
	get_tree().paused = false
	pass # Replace with function body.


func _on_exit_pressed():
	
	pass # Replace with function body.
