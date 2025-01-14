class_name LevelTileMap extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	GlobalLevelManager.change_map_bounds(get_bounds())
	pass # Replace with function body.

func get_bounds() -> Array[Vector2]:
	var bounds: Array[Vector2] = [];
	var position = Vector2.ZERO
	var end = Vector2.ZERO
	for c in get_children():
		if c is TileMapLayer :
			var rect :Rect2i = c.get_used_rect();
			position = rect.position * c.rendering_quadrant_size;
			end = rect.end * c.rendering_quadrant_size
			bounds.append(Vector2(position));
			bounds.append(Vector2(end));
	return bounds;
