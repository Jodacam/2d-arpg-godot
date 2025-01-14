class_name PlayerInteractions extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	pass # Replace with function body.
	
func update_direction(_new_direction:Vector2)->void :
	_new_direction.angle()
	match _new_direction: 
		Vector2.DOWN: 
			rotation_degrees = 0;
		Vector2.UP :
			rotation_degrees = 180;
		Vector2.LEFT:
			rotation_degrees = 90;
		Vector2.RIGHT :
			rotation_degrees = -90;
		_:
			rotation_degrees = 0;
	pass


func _on_player_direction_changed(new_direction: Vector2) -> void:
	update_direction(new_direction)
	pass # Replace with function body.
