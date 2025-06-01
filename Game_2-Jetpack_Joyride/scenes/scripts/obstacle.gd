extends Node2D

@export var speed: int = 6

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= speed #scroll pipe across screen
	if global_position.x < -5: #delete pipe at the edge of the screen
		queue_free()
