extends CharacterBody2D

@export var base_speed : float = 300.0     # Starting speed (matches your old const SPEED)
@export var max_speed : float = 1000.0     # Maximum speed limit
@export var speed_per_point : float = 30.0 # Speed increase per point

const LANE_DISTANCE = 220.0 

var current_lane = 0
var target_y = 0.0

func _ready():
	target_y = position.y
	$Sprite2D.texture = load(Global.player_skin)

func _physics_process(delta):
	# Calculate target speed based on Global.score
	var target_speed = base_speed + (Global.score * speed_per_point)
	
	# Clamp the speed so it never exceeds max_speed
	var current_speed = min(target_speed, max_speed)
	
	# Apply the dynamically calculated speed
	velocity.x = current_speed
	
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
