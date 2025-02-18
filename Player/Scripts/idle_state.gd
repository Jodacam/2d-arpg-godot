class_name IdleState extends State

@onready var walk: WalkState = $"../Walk"
@onready var attack: AttackState = $"../Attack"

## What happends on enter state
func enter_state() -> void:
	if animation_image : player.sprite.texture = animation_image;
	player.update_animation("idle");
	pass
	
func exit_state() ->void:
	pass
	
func update_state(_delta:float) -> State:
	player.velocity = Vector2.ZERO;
	if(player.direction != Vector2.ZERO) : return walk
	
	if(player.set_direction()) : player.update_animation('idle')
	return null;

func update_physics(_delta:float) -> State:
	return null
	
func handle_input(_event:InputEvent) ->State:
	if(_event.is_action_pressed("attack")) : return attack
	return null
