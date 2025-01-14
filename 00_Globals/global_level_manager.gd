extends Node
signal tile_map_bound_changed(_bounds:Array[Vector2])
var current_tile_map_bounds : Array[Vector2]

func change_map_bounds(_bounds:Array[Vector2]) -> void:
	tile_map_bound_changed.emit(_bounds)
	current_tile_map_bounds = _bounds
	pass
