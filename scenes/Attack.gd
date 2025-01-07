extends Node2D  # Eller AnimatedSprite2D om nödvändigt

@export var bullet_scene: PackedScene  # Länka Bullet.tscn här i Inspector

func attack(target_position: Vector2) -> void:
	if bullet_scene:
		var bullet = bullet_scene.instantiate()
		get_parent().add_child(bullet)
		bullet.global_position = global_position
		bullet.look_at(target_position)
		print("Bullet fired towards:", target_position)
	else:
		print("Bullet scene is not assigned!")
