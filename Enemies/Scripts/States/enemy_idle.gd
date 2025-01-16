class_name EnemyIdle extends EnemyState



@export_category('AI')
@export var state_duration_min :float = 0.5
@export var state_duration_max :float = 1.5
@export var after_idle_state: EnemyState

var _timer : float = 0.0
# Called when the node enters the scene tree for the first time.
func init() -> void:
	pass # Replace with function body.

## What happends on enter state
func enter_state() -> void:
	enemy.update_animation(anim_name)
	enemy.velocity = Vector2.ZERO
	_timer = randf_range(state_duration_min,state_duration_max);
	pass
	
func exit_state() ->void:
	pass
	
func update_state(_delta:float) -> State:
	_timer -=_delta;
	if _timer <= 0 :
		return after_idle_state
	return null;

func update_physics(_delta:float) -> State:
	return null
	
func handle_input(_event:InputEvent) ->State:
	return null
