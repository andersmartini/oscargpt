extends AnimatedSprite2D

@onready var weapon = $Weapon  # Adjust the path if the weapon is nested differently


func _ready() -> void:
	if weapon:
		print("Weapon is attached to the character.")
	else:
		print("AnimatedSprite2D nooooot found!")  # Om noden inte hittas


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("shoot"):  # Byt "shoot" till din input-action
		weapon.attack(get_global_mouse_position())

var weapon_scene = preload("res://scenes/Weapon.tscn")  # Update the path to match the actual location of your weapon scene

func add_weapon():
	var weapon_instance = weapon_scene.instantiate()
	add_child(weapon_instance)
	weapon_instance.position = Vector2(0, 0)  # Adjust position as needed
