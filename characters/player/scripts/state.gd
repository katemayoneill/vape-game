class_name State extends Node

## stores a reference to the Player that the state belongs to
static var player : Player

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


## What happends when the player enters this state ?
func Enter() -> void :
	pass

## What happens when the players exits the state ?
func Exit() -> void :
	pass

## What happens during the _process update in ths State ? 
func Process(_delta : float) -> State:
	return null

## what happens during the _physics_process update in this state ?
func Physics(_delta : float) -> State:
	return null

## What happens with input events in this state ?
func HandleInput( _event  : InputEvent) -> State :
	return null
