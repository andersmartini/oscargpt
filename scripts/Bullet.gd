extends Area2D

@export var speed: float = 600.0  # Speed of the bullet
@export var lifetime: float = 2.0  # Lifetime of the bullet in seconds

func _ready():
	# Use `await` instead of `yield` to remove the bullet after its lifetime
	await get_tree().create_timer(lifetime).timeout
	queue_free()

func _physics_process(delta: float) -> void:
	# Move the bullet forward
	position += Vector2(speed * delta, 0).rotated(rotation)
