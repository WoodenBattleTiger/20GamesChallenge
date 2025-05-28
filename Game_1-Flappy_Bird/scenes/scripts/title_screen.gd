extends Control

@export var levelScene: PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#johan tween
	var johan_tween = create_tween()
	johan_tween.set_loops()
	johan_tween.tween_property($Sprite2D, "position", Vector2(575, 425), 1)
	johan_tween.set_ease(Tween.EASE_OUT)
	johan_tween.chain().tween_property($Sprite2D, "position", Vector2(575, 325), 1)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_play_button_button_down() -> void:
	get_tree().change_scene_to_packed(levelScene)
