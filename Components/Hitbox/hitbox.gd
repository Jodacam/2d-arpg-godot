class_name Hitbox extends Area2D
@export var healthpool:HealthPool
signal damage_was_take( damage:float)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
	
func take_damage(damage:float) ->void:
	damage_was_take.emit(damage)
	if healthpool :
		healthpool.health -=damage;
	pass
