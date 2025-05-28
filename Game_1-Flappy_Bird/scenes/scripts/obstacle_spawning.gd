extends Node2D

var spawn_timer: int
@export var obstacle: PackedScene
var obs_speed: float = 1.0
var spawn_rate: int = 500

signal on_speed_increase

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var new_obs = obstacle.instantiate()
	add_child(new_obs)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if spawn_timer < spawn_rate:
		spawn_timer += 1
	else:
		var new_obs = obstacle.instantiate()
		add_child(new_obs)
		spawn_timer = 0
		increase_speed()

func increase_speed():
	if obs_speed < 2.5:
		obs_speed += 0.1
	for obs in get_children(): #increase speed of all active obstacles
		obs.speed = obs_speed
	if spawn_rate > 120:
		spawn_rate -= 20
	#on_speed_increase.emit()
