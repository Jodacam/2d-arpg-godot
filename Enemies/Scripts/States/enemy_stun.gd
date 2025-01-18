class_name EnemyStun extends EnemyState


@export var knock_back_speed: float = 200
@export var decelerate:float = 10
@export var next_state: EnemyState

var damaged = false;
func enter_state() ->void :
	
	damaged = true;
	enemy.update_animation(anim_name)
	enemy.animation_player.animation_finished.connect(on_end_animation)
	pass
func on_end_animation(_d) -> void:
	damaged = false;
	enemy.animation_player.animation_finished.disconnect(on_end_animation)
	pass
func update_state(_delta:float) -> State:
	if(!damaged): return next_state;
	enemy.velocity -= enemy.velocity * decelerate * _delta;
	return null;


func _on_slime_enemy_damaged(damage:float) -> void:
	state_machine.change_state(self)
	pass # Replace with function body.
