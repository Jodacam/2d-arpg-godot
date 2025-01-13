extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func take_damage(_damage : float) -> void:
	queue_free()
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_hitbox_damage_was_take(damage: float) -> void:
	take_damage(damage)
	pass # Replace with function body.
