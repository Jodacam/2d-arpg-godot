class_name AttackState extends State

var attacking:bool;
@export var attack_audio :AudioStream
@export_range(1,20,0.5) var deceleration : float = 5
@onready var walk: WalkState = $"../Walk"
@onready var animation_player: AnimationPlayer = $"../../AnimationPlayer"
@onready var audio_effects: AudioStreamPlayer2D = $"../../AudioEffects"
@onready var hurtbox: Hurtbox = $"../../Interuptions/Hurtbox"

## What happends on enter state
func enter_state() -> void:
	if animation_image : player.sprite.texture = animation_image;
	audio_effects.stream = attack_audio;
	audio_effects.play();
	player.update_animation("attack");
	attacking = true;
	hurtbox.monitoring = true;
	animation_player.animation_finished.connect(EndAttack)
	pass
	
func exit_state() ->void:
	attacking = false;
	hurtbox.monitoring = false;
	animation_player.animation_finished.disconnect(EndAttack)
	pass
	
func update_state(_delta:float) -> State:
	player.velocity -= player.velocity * deceleration * _delta;
	if !attacking : return walk
	return null;

func update_physics(_delta:float) -> State:
	return null
	
func handle_input(_event:InputEvent) ->State:
	return null
func EndAttack(_animation_name):
	attacking = false;
	pass
