extends Node2D

var spawn_timer: int
@export var obstacle: PackedScene
var spawn_rate: int = 450

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spawn_timer < spawn_rate:
		spawn_timer += 1
	else:
		var new_obs = obstacle.instantiate()
		new_obs.global_position.x = 1152
		new_obs.global_position.y = randi_range(64, 600)
		add_child(new_obs)
		spawn_timer = 0
