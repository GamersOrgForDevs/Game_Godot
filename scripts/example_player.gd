extends CharacterBody2D

@export var moveSpeed : float = 100

func _physics_process(_delta):
	#Set input direction
	var inputDirection = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	#Update Velocity
	velocity = inputDirection * moveSpeed
	
	#Move and SLide function uses velocity of character body to move character on map
	move_and_slide()
