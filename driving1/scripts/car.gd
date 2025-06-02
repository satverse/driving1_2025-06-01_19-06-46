extends CharacterBody2D

@export var acceleration := 400.0
@export var max_speed := 250.0
@export var friction := 300.0
@export var rotation_speed := 3.0

func _physics_process(delta):
	# Rotation (Left/Right)
	rotation -= rotation_speed * delta
	if Input.is_action_pressed("left"):
		rotation -= rotation_speed * delta
	elif Input.is_action_pressed("right"):
		rotation += rotation_speed * delta
	velocity += Vector2.RIGHT.rotated(rotation) * acceleration * delta
# Acceleration (Forward/Backward)
	if Input.is_action_pressed("ui_up"):
		velocity += Vector2.RIGHT.rotated(rotation) * acceleration * delta
	elif Input.is_action_pressed("ui_down"):
		velocity -= Vector2.RIGHT.rotated(rotation) * acceleration * delta
	else:
		# Apply friction
		if velocity.length() > 0:
			var friction_force = friction * delta
			velocity = velocity.move_toward(Vector2.ZERO, friction_force)

	# Clamp speed
	if velocity.length() > max_speed:
		velocity = velocity.normalized() * max_speed

	# Move the car (Godot 4 syntax — no arguments!)
	move_and_slide()
