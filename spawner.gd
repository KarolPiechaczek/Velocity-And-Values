extends Node2D

# Load the puzzle scene template
var puzzle_scene = preload("res://math_puzzle.tscn")

# Reference to the player's car
@onready var car = $"../Car"

var next_spawn_x = 1000.0 # Position of the first puzzle
var spawn_distance = 2000.0 # Distance between consecutive puzzles

func _process(_delta):
	# Check if the car is getting close to the next spawn point
	if car.global_position.x + 1000.0 > next_spawn_x:
		spawn_puzzle()

func spawn_puzzle():
	var new_puzzle = puzzle_scene.instantiate()
	
	# Set puzzle position ahead of the car
	new_puzzle.global_position.x = next_spawn_x
	new_puzzle.global_position.y = 0 
	
	new_puzzle.mode = Global.math_mode
	
	# Add the puzzle to the scene
	add_child(new_puzzle)
	
	# Move the spawn marker for the next puzzle
	next_spawn_x += spawn_distance
