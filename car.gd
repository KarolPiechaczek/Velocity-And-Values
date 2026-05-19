extends CharacterBody2D

const SPEED = 300.0 
const LANE_DISTANCE = 220.0 

var current_lane = 0
var target_y = 0.0

func _ready():
	$Sprite2D.texture = load(Global.player_skin)
	target_y = position.y

func _physics_process(delta):
	# Car drives to the right
	velocity.x = SPEED
	
	# Change lane (Up Arrow)
	if Input.is_action_just_pressed("ui_up") and current_lane > -1:
		current_lane -= 1
		target_y -= LANE_DISTANCE
		
	# Change lane (Down Arrow)
	if Input.is_action_just_pressed("ui_down") and current_lane < 1:
		current_lane += 1
		target_y += LANE_DISTANCE
		
	# Smooth transition between lanes
	position.y = move_toward(position.y, target_y, 600.0 * delta)
	
	move_and_slide()
