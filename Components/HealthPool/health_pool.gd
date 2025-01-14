class_name HealthPool extends Node2D

signal on_health_down(_damage:float, health:float);
signal on_health_up(_healed:float, health:float);
signal on_no_health(_damage:float);

@export var max_health:float 
var _actual_health : float;
var health : float :
	set (value):
		if(value > _actual_health) : on_health_up.emit(value-_actual_health,_actual_health)
		
		if(_actual_health <= 0) : 
			_actual_health = value
			return;
		
		if(value < _actual_health) : on_health_down.emit(_actual_health-value,_actual_health)

		_actual_health = value;
		
		if(_actual_health <= 0) : on_no_health.emit(_actual_health - value)
	get:
		return _actual_health;
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	_actual_health = max_health
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
