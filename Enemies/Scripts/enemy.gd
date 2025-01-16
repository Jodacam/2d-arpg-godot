class_name Enemy extends CharacterBody2D

signal direction_changed(new_direction:Vector2);
signal enemy_damaged();

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

const DIR_4 = [Vector2.RIGHT,Vector2.DOWN,Vector2.LEFT,Vector2.UP];

@export var healthpool:HealthPool 
@onready var sprite_2d: Sprite2D = $Sprite2D
@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var state_machine: EnemyStateMachine = $StateMachine
@onready var enemy_die: EnemyDie = $StateMachine/EnemyDie

func _ready() -> void:
	state_machine.initialize(self)
	healthpool.on_no_health.connect(die)
	pass
func _process(_delta: float) -> void:
	pass
func die(_d) -> void:
	state_machine.change_state(enemy_die)
	pass
	
func _physics_process(_delta: float) -> void:
	move_and_slide()
	pass
func set_direction(new_direction:Vector2) -> bool:
	direction = new_direction;
	
	if direction == Vector2.ZERO :	return false;
	
	var direction_id = int(round((direction+cardinal_direction*0.1).angle()/TAU * DIR_4.size()))
	
	var new_dir: Vector2 = DIR_4[direction_id];
	
	if new_dir == cardinal_direction:	return false;	
	
	cardinal_direction = new_dir;
	direction_changed.emit(cardinal_direction);
	return true;
func update_animation(state:String)->void:
	animation_player.play(state + "_" + anim_direction())
	pass

func anim_direction() -> String:
	if cardinal_direction == Vector2.DOWN : 
		return "down";
	if cardinal_direction == Vector2.LEFT :
		return "left";
	if cardinal_direction == Vector2.UP :
		return "up";
	if cardinal_direction == Vector2.RIGHT : 
		return "right";
	return "down"
