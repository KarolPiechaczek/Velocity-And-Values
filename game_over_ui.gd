extends Control

func _ready():
	# Display the final score retrieved from the Global script
	$ScoreL.text = "Final Score: " + str(Global.score)

func _on_restart_b_pressed():
	# 1. Unpause the game engine
	get_tree().paused = false
	
	# 2. Reset the player's score
	Global.score = 0 
	
	# 3. DESTROY THIS UI AND ITS CANVAS LAYER (Fix for the ghost screen)
	get_parent().queue_free()
	
	MusicPlayer.get_node("AudioStreamPlayer").play()
	
	# 4. Reload the current map
	get_tree().reload_current_scene() 

func _on_main_menu_b_pressed():
	# 1. Unpause the game engine
	get_tree().paused = false
	
	# 2. Reset the player's score
	Global.score = 0
	
	# 3. DESTROY THIS UI AND ITS CANVAS LAYER (Fix for the ghost screen)
	get_parent().queue_free()
	
	MusicPlayer.get_node("AudioStreamPlayer").play()
	
	# 4. Go back to the Main Menu scene
	get_tree().change_scene_to_file("res://main_menu.tscn")
