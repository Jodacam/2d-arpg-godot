class_name EnemyWander extends EnemyState
@onready var enemy_idle: EnemyIdle = $"../EnemyIdle"
@export var speed:float = 20.0

@export var state_animation_duration : float = 0.5
@export var state_cycles_min: int = 1
@export var state_cycles_max: int = 3

var _timer : float = 0.0
func enter_state() -> void:
	_timer = randi_range(state_cycles_min,state_cycles_max) * state_animation_duration
	var dir = enemy.DIR_4[randi_range(0,3)];
	enemy.set_direction(dir);
	enemy.velocity = dir * speed
	enemy.update_animation(anim_name)
	pass
	
func update_state(_delta:float)->State :
	_timer -= _delta
	
	if _timer <=0 : return enemy_idle
	
	
	return null
