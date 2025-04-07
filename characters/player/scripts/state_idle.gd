class_name State_Idle extends State

@onready var walk : State = $"../Walk"

## What happends when the player enters this state ?
func Enter() -> void :
	player.UpdateAnimation("idle")
	pass

## What happens when the players exits the state ?
func Exit() -> void :
	pass

## What happens during the _process update in ths State ? 
func Process(_delta : float) -> State:
	if player.velocity != Vector2.ZERO:
		return walk
	player.velocity = Vector2.ZERO
	return null

## what happens during the _physics_process update in this state ?
func Physics(_delta : float) -> State:
	return null

## What happens with input events in this state ?
func HandleInput( _event  : InputEvent) -> State :
	return null
