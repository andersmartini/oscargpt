extends AnimatedSprite2D

@onready var weapon = $Weapon  # Adjust the path if the weapon is nested differently

func _ready() -> void:
	if weapon:
		print("Weapon is attached to the character.")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("attack"):  # Replace "attack" with your actual input action
		weapon.attack(get_global_mouse_position())  # Trigger weapon's attack

var weapon_scene = preload("res://scenes/Weapon.tscn")  # Update the path to match the actual location of your weapon scene

func add_weapon():
	var weapon_instance = weapon_scene.instantiate()
	add_child(weapon_instance)
	weapon_instance.position = Vector2(0, 0)  # Adjust position as needed
