class_name Player extends CharacterBody2D

var move_speed : float = 100.0

func _ready():
	
	pass

func _process(delta):
	
	var direction : Vector2 = Vector2.ZERO
	
	direction.x = Input.get_action_strength("right") - Input.get_action_strength("left")
	direction.y = Input.get_action_strength("up") - Input.get_action_strength("down")
	
	velocity = direction * move_speed * delta
	
	pass
	
func _physics_process(delta):
	move_and_slide()
	
