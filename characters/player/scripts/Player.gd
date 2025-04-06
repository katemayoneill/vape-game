"""
@file Player.gd
@brief Script for controlling the player character in the game.

This script handles player movement, direction, state, and animations.

@note Original code by Mike Malaska.
"""

class_name Player extends CharacterBody2D

"""
@brief The cardinal direction the player is facing.
"""
var cardinal_direction : Vector2 = Vector2.DOWN

"""
@brief The current movement direction of the player.
"""
var direction : Vector2 = Vector2.ZERO

"""
@brief The current state of the player (e.g., "idle", "walk").
"""
var state : String = "idle"

"""
@brief Reference to the AnimationPlayer node for handling animations.
"""
@onready var animation_player : AnimationPlayer = $AnimationPlayer

"""
@brief Reference to the Sprite2D node for handling sprite transformations.
"""
@onready var sprite : Sprite2D = $Sprite2D

"""
@brief The movement speed of the player.
"""
@export var move_speed : float = 200.0

"""
@brief Called when the node is added to the scene.
"""
func _ready():
	pass

"""
@brief Called every frame to process input and update the player's state.
@param delta The frame time in seconds.
"""
func _process(delta):
	# Get input direction
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("down") - Input.get_action_strength("up")
	
	# Normalize direction to prevent faster diagonal movement
	if direction.length() > 0:
		direction = direction.normalized()
	
	# Set velocity directly (not multiplied by delta here)
	velocity = direction * move_speed
	
	if SetState() == true || SetDirection() == true:
		UpdateAnimation()
	
"""
@brief Called every physics frame to handle movement.
@param delta The frame time in seconds.
"""
func _physics_process(delta):
	move_and_slide()

"""
@brief Updates the player's cardinal direction based on input.
@return True if the direction changed, otherwise false.
"""
func SetDirection() -> bool :
	var new_dir : Vector2 = cardinal_direction
	if direction == Vector2.ZERO:
		return false
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
		
	if new_dir == cardinal_direction:
		return false
	cardinal_direction = new_dir
	sprite.scale.x = -1 if cardinal_direction == Vector2.LEFT else 1
	return true
	
"""
@brief Updates the player's state based on movement.
@return True if the state changed, otherwise false.
"""
func SetState() -> bool : 
	var new_state : String = "idle" if direction == Vector2.ZERO else "walk"
	if new_state == state:
		return false
	state = new_state
	return true
	
"""
@brief Updates the player's animation based on the current state and direction.
"""
func UpdateAnimation() -> void : 
	animation_player.play(state + "_" + AnimDirection())
	pass
	
"""
@brief Determines the animation direction string based on the cardinal direction.
@return A string representing the animation direction ("down", "up", or "side").
"""
func AnimDirection() -> String :
	if cardinal_direction == Vector2.DOWN:
		return "down"
	elif cardinal_direction == Vector2.UP:
		return "up"
	else:
		return "side"

