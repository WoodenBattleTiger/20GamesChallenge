extends CharacterBody2D


const JUMP_VELOCITY = -400.0

signal jump


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY
		jump.emit()

	move_and_slide()
