extends CharacterBody2D

const SPEED = 300.0

func _physics_process(delta):
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var directionX = Input.get_axis("ui_left", "ui_right")
	var directionY = Input.get_axis("ui_up", "ui_down")
	var input := Vector2(directionX, directionY)
	
	position += input * SPEED * delta
	
	if input == Vector2(1,0): # forward
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = false
	
	elif input == Vector2(-1, 0): # backward
		$AnimatedSprite2D.play("Run")
		$AnimatedSprite2D.flip_h = true
		
	elif input == Vector2(0, -1): # down
		$AnimatedSprite2D.play("Run")
		
	
	elif input == Vector2(0, 1): # up
		$AnimatedSprite2D.play("Run")
		
		
	elif input == Vector2(0, 0):
		$AnimatedSprite2D.play("Idle")
		

	move_and_slide()
