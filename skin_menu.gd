extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_car_pressed() -> void:
	Global.player_skin = "res://car assets/car_red.png"


func _on_car_2_pressed() -> void:
	Global.player_skin = "res://car assets/car_yellow.png"


func _on_car_3_pressed() -> void:
	Global.player_skin = "res://car assets/car_green.png"


func _on_car_4_pressed() -> void:
	Global.player_skin = "res://car assets/car_blue.png"


func _on_car_5_pressed() -> void:
	Global.player_skin = "res://car assets/car_black.png"


func _on_motorcycle_pressed() -> void:
	Global.player_skin = "res://car assets/motorcycle_red.png"


func _on_motorcycle_2_pressed() -> void:
	Global.player_skin = "res://car assets/motorcycle_yellow.png"


func _on_motorcycle_3_pressed() -> void:
	Global.player_skin = "res://car assets/motorcycle_green.png"


func _on_motorcycle_4_pressed() -> void:
	Global.player_skin = "res://car assets/motorcycle_blue.png"


func _on_motorcycle_5_pressed() -> void:
	Global.player_skin = "res://car assets/motorcycle_black.png"


func _on_back_b_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
