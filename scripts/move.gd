extends Sprite2D


var simulate = false
@export var move_vector = Vector2.LEFT


func _process(delta: float) -> void:
	if simulate:
		global_position += move_vector * delta
