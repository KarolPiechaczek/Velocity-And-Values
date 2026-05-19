extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_add_b_pressed() -> void:
	# Set mode to 0 (ADD)
	Global.math_mode = 0


func _on_sub_b_pressed() -> void:
	# Set mode to 1 (SUB)
	Global.math_mode = 1


func _on_mul_b_pressed() -> void:
	# Set mode to 2 (MUL)
	Global.math_mode = 2


func _on_div_b_pressed() -> void:
	# Set mode to 3 (DIV)
	Global.math_mode = 3


func _on_rand_b_pressed() -> void:
	# Set mode to 4 (RAND)
	Global.math_mode = 4


func _on_back_b_pressed() -> void:
	get_tree().change_scene_to_file("res://main_menu.tscn")
