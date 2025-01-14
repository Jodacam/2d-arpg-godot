class_name PlayerCamera extends Camera2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalLevelManager.connect("tile_map_bound_changed",update_limits);
	pass # Replace with function body.
func update_limits(bound:Array[Vector2]) ->void :
	limit_left = int(bound[0].x);
	limit_right = int(bound[1].x);
	limit_bottom = int(bound[1].y);
	limit_top = int(bound[0].y);
	pass
