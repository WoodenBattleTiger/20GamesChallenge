extends Node2D

var type: int
var speed: float = 1.0

signal update_score
signal player_dies

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	type = randi_range(1,3) #choose one of the three pipe shapes
	match type:
		1:
			$Top.size.y = 85
			$Top.position.y = 85
			$Top/Area2D/CollisionShape2D.shape.size.y = 85
			$Bottom.size.y = 385
			$Bottom.position.y = 263
			$Bottom/Area2D/CollisionShape2D.shape.size.y = 385
		2:
			$Top.size.y = 170
			$Top.position.y = 170
			$Top/Area2D/CollisionShape2D.shape.size.y = 170
			$Bottom.size.y = 300
			$Bottom.position.y = 348
			$Bottom/Area2D/CollisionShape2D.shape.size.y = 300
		3:
			$Top.size.y = 340
			$Top.position.y = 340
			$Top/Area2D/CollisionShape2D.shape.size.y = 340
			$Bottom.size.y = 130
			$Bottom.position.y = 518
			$Bottom/Area2D/CollisionShape2D.shape.size.y = 130    
			
	$Top/Area2D/CollisionShape2D.position.y = $Top/Area2D/CollisionShape2D.shape.size.y / 2 
	$Bottom/Area2D/CollisionShape2D.position.y = $Bottom/Area2D/CollisionShape2D.shape.size.y / 2 
	
	update_score.connect(get_parent().get_parent()._on_update_score)
	player_dies.connect(get_parent().get_parent().on_player_death)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	global_position.x -= speed #scroll pipe across screen
	if global_position.x < -5: #delete pipe at the edge of the screen
		queue_free()


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "Player": #Destroy player if they hit pipe
		player_dies.emit()


func _on_exit_area_body_exited(body: Node2D) -> void:
	if body.name == "Player": #Update score if they pass the pipe (exit the exit area)
		update_score.emit()
