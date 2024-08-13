extends Node2D

@onready var SceneTransitionAnimation = $SceneTransitionAnimation/AnimationPlayer
func _on_button_pressed():
	SceneTransitionAnimation.play("Water_Fills")
	await get_tree().create_timer(2.8027).timeout
	get_tree().change_scene_to_file("res://main.tscn")

func _on_button_2_pressed():
	get_tree().quit()


#func _on_check_button_toggled(toggled_on):
	#if toggled_on == true:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_FULLSCREEN)
	#else:
		#DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)





