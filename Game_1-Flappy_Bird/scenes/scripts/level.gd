extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass
	#$Ui.obs_speed = $Obstacles.obs_speed
	#$Ui.obs_rate = $Obstacles.spawn_rate
	$Ui.update_ui()
	$BGMusic.play()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_obstacles_on_speed_increase() -> void:
	$Ui.obs_speed = $Obstacles.obs_speed
	$Ui.obs_rate = $Obstacles.spawn_rate
	$Ui.update_ui()

func _on_update_score() -> void:
	$Ui.score += 1
	$Ui.update_ui();
	$Score.play()
	$Score.pitch_scale += 0.001
	
func on_player_death():
	$Squeak.play()
	$Ui/Panel.set_visible(true)
	get_tree().paused = true

func restart():
	#handle process and UI change
	get_tree().paused = false
	$Ui/Panel.set_visible(false)
	
	#handle obstacle reset
	$Obstacles.obs_speed = 1.0
	$Obstacles.spawn_rate = 500
	for obs in $Obstacles.get_children():
		obs.queue_free()
	
	#handle player reset
	$Player.position = Vector2i(220, 100)
	$Player.velocity.y = 0 #reset velocity
		
	#handle UI reset
	$Ui.score = 0
	$Ui.update_ui()
		
func play_flap_sound():
	$Flap.play()
