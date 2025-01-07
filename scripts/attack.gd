extends Node2D

export (PackedScene) var bullet_scene  # Länka Bullet.tscn här i Inspector

func attack(target_position):
	# Kontrollera att bullet_scene är kopplat
	if bullet_scene:
		# Skapa en instans av Bullet
		var bullet = bullet_scene.instance()  # Använd .instance() i Godot 3.x
		# Lägg till Bullet som en barnnod i spelet
		get_parent().add_child(bullet)
		# Placera Bullet vid vapnet
		bullet.global_position = global_position
		# Rikta Bullet mot målet
		bullet.look_at(target_position)
	else:
		print("Bullet scene not assigned!")
