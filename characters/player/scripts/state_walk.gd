class_name State_Walk extends State

@export var move_speed : float = 100.0
@onready var idle : State = $"../Idle"

## What happends when the player enters this state ?
func Enter() -> void :
	player.UpdateAnimation("walk")
	pass

## What happens when the players exits the state ?
func Exit() -> void :
	pass

## What happens during the _process update in ths State ? 
func Process(_delta : float) -> State:
	if player.direction == Vector2.ZERO :
		return idle
	player.velocity = player.direction * move_speed
	
	if player.SetDirection():
		player.UpdateAnimation("walk")
	return null

## what happens during the _physics_process update in this state ?
func Physics(_delta : float) -> State:
	return null

## What happens with input events in this state ?
func HandleInput( _event  : InputEvent) -> State :
	return null
