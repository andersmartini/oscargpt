extends CharacterBody2D

# Movement variables
@export var speed: float = 200.0  # Spelarens hastighet
@export var jump_strength: float = -400.0  # Hoppstyrka
@export var gravity: float = 800.0  # Gravitation

# Double Jump ability
var can_double_jump: bool = false

# Weapon variables
@onready var weapon = $Weapon  # Länka vapennoden här
@export var weapon_scene: PackedScene  # Länka Weapon.tscn här i Inspector

func _ready() -> void:
	add_weapon()
	if weapon:
		print("Weapon is attached to the character.")
	else:
		print("Weapon is null in _ready.")

# Rörelselogik
func _physics_process(delta: float) -> void:
	# Applicera gravitation
	velocity.y += gravity * delta

	# Horisontell rörelse
	velocity.x = 0.0
	if Input.is_action_pressed("ui_right"):
		velocity.x = speed
	elif Input.is_action_pressed("ui_left"):
		velocity.x = -speed

	# Hopp
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			velocity.y = jump_strength
			can_double_jump = true  # Reset double jump ability
		elif can_double_jump:
			velocity.y = jump_strength
			can_double_jump = false  # Use the double jump

	# Flytta spelaren
	move_and_slide()

# Hantera input för att skjuta
func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):  # Byt "attack" till din faktiska input-action
		if weapon and weapon.has_method("attack"):
			weapon.attack(get_global_mouse_position())  # Skjut vapnet
		else:
			print("Weapon or attack function is not assigned!")

# Lägg till vapen
func add_weapon():
	print("Attempting to add weapon...")
	if weapon_scene:
		var weapon_instance = weapon_scene.instantiate()
		add_child(weapon_instance)
		weapon_instance.position = Vector2(0, 0)  # Justera position som behövs
		weapon = weapon_instance
		print("Weapon instance added: ", weapon)
	else:
		print("weapon_scene is not assigned!")
