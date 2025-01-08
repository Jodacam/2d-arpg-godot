class_name WalkState extends State
@onready var idle: IdleState = $"../Idle"
@onready var attack: AttackState = $"../Attack"

@export var speed = 100
## What happends on enter state
func enter_state() -> void:
	player.update_animation("walk");
	pass
	
func exit_state() ->void:
	pass
	
func update_state(_delta:float) -> State:
	player.velocity = player.direction.normalized() * speed
	
	if(player.direction == Vector2.ZERO) : return idle;
	
	if(player.set_direction()) : player.update_animation('walk')
	return null;

func update_physics(_delta:float) -> State:
	return null
	
func handle_input(_event:InputEvent) ->State:
	if(_event.is_action_pressed("attack")) : return attack
	return null
