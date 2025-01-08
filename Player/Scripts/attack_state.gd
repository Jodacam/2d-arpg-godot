class_name AttackState extends State

var attacking:bool;
@export var attack_audio :AudioStream
@onready var walk: WalkState = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var audio_effects: AudioStreamPlayer2D = $"../../AudioEffects"

## What happends on enter state
func enter_state() -> void:
	audio_effects.stream = attack_audio;
	audio_effects.play();
	player.update_animation("attack");
	attacking = true;
	animation_player.animation_finished.connect(EndAttack)
	pass
	
func exit_state() ->void:
	attacking = false;
	animation_player.animation_finished.disconnect(EndAttack)
	pass
	
func update_state(_delta:float) -> State:
	player.velocity = Vector2.ZERO;
	if !attacking : return walk
	return null;

func update_physics(_delta:float) -> State:
	return null
	
func handle_input(_event:InputEvent) ->State:
	return null
func EndAttack(_animation_name):
	attacking = false;
	pass
