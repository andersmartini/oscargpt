extends Node2D

@onready var sprite = $AnimatedSprite2D  # Reference the weapon's AnimatedSprite2D

func attack(target_position: Vector2) -> void:
	sprite.play("attack")  # Play the "attack" animation
	print("Weapon attacking towards:", target_position)
