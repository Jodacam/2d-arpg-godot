class_name Hurtbox extends Area2D

@export var damage:float = 10.0;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	area_entered.connect(on_area_entered)
	pass # Replace with function body.

func on_area_entered(area:Area2D) -> void:
	if area is Hitbox :
		area.take_damage(damage)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
