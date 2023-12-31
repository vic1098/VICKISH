extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

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
