extends Control

var score = 0
var obs_speed = 0
var obs_rate = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Panel/MarginContainer/VBoxContainer/Button.pressed.connect(get_tree().root.get_node("Level").restart)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func update_ui():
	$GameInfo.text = "Score: " + str(score) 
