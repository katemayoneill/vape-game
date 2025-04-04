class_name Player extends CharacterBody2D

@export var move_speed : float = 200.0

func _ready():
	pass

func _process(delta):
	# Get input direction
	var direction = Vector2.ZERO
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	# Normalize direction to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
	
	# Set velocity directly (not multiplied by delta here)
	velocity = direction * move_speed
	
func _physics_process(delta):
	move_and_slide()
