extends Camera2D

@onready var car = $"../Car"

func _process(_delta):
	# X position + 450 so car is aligned to the left
	# Y position no changes
	global_position.x = car.global_position.x + 450
