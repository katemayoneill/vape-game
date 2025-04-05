class_name Player extends CharacterBody2D

var cardinal_direction : Vector2 = Vector2.DOWN
var direction : Vector2 = Vector2.ZERO
var state : String = "idle"


@onready var animation_player : AnimationPlayer = $AnimationPlayer
@onready var sprite : Sprite2D = $Sprite2D

@export var move_speed : float = 200.0

func _ready():
	pass

func _process(delta):
	# Get input direction
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	# Normalize direction to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
	
	# Set velocity directly (not multiplied by delta here)
	velocity = direction * move_speed
	
	if SetState() == true:
		UpdateAnimation()
	
func _physics_process(delta):
	move_and_slide()

func SetDirection() -> bool :
	return true
	
func SetState() -> bool : 
	var new_state : String = "idle" if direction == Vector2.ZERO else "walk"
	if new_state == state:
		return false
	return true
	
func UpdateAnimation() -> void : 
	animation_player.play(state + "_" + AnimDirection())
	pass
	
func AnimDirection() -> String :
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"
	
