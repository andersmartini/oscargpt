extends Area2D

@export var speed: float = 600.0  # Hastighet för projektilen
@export var lifetime: float = 2.0  # Livslängd för projektilen i sekunder

func _ready() -> void:
	# Ta bort projektilen efter dess livslängd
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	# Flytta projektilen framåt baserat på rotation
	position += Vector2(speed * delta, 0).rotated(rotation)
