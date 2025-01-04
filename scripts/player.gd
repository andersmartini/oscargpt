extends CharacterBody2D

# Movement variables
var speed : float = 200.0
var jump_strength : float = -400.0
var gravity : float = 800.0

# Double Jump ability
var can_double_jump : bool = false

# Called every frame
func _physics_process(delta: float) -> void:
	velocity.y += gravity * delta
	
	# Horizontal movement
	velocity.x = 0.0
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed

	# Jumping
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_strength
			can_double_jump = true  # Reset double jump ability
		elif can_double_jump:
			velocity.y = jump_strength
			can_double_jump = false  # Use the double jump

	# Apply the velocity
	move_and_slide()
