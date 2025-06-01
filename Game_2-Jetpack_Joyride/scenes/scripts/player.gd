extends CharacterBody2D


const JUMP_VELOCITY = -400.0
const acceleration = 10


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_pressed("ui_accept"):
		velocity.y = JUMP_VELOCITY

	move_and_slide()
