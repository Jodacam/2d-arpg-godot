class_name WalkState extends State
@onready var idle: IdleState = $"../Idle"
@onready var attack: AttackState = $"../Attack"
@onready var running: RunningState = $"../Running"


@export var speed = 100
## What happends on enter state
func enter_state() -> void:
	if animation_image : player.sprite.texture = animation_image;
	player.update_animation("walk");
	pass
	
func exit_state() ->void:
	pass
	
func update_state(_delta:float) -> State:
	
	if(Input.get_action_strength("run") > 0) : return running;
	
	player.velocity = player.direction.normalized() * speed
	
	if(player.direction == Vector2.ZERO) : return idle;
	
	if(player.set_direction()) : player.update_animation('walk')
	return null;

func update_physics(_delta:float) -> State:
	return null
	
func handle_input(_event:InputEvent) ->State:
	if(_event.is_action_pressed("attack")) : return attack
	
	if(_event.is_action_pressed("run")) : return running
	return null
