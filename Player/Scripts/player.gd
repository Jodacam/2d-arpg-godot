class_name Player extends CharacterBody2D

var cardinal_direction: Vector2 = Vector2.DOWN
var direction: Vector2 = Vector2.ZERO

@onready var animation_player: AnimationPlayer = $AnimationPlayer

@onready var sprite: Sprite2D = $Sprite2D

@onready var state_machine: PlayerStateMachine = $StateMachine


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	state_machine.initialize(self)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame
func _process(delta: float) -> void:
	direction = Input.get_vector("left","right","up","down")

	pass
func _physics_process(delta: float) -> void:
	move_and_slide()
	pass
	
func set_direction() -> bool:
	var new_dir: Vector2 = cardinal_direction;
	if direction == Vector2.ZERO :	return false;
	
	if direction.y == 0:
		new_dir = Vector2.LEFT if direction.x < 0 else Vector2.RIGHT
	elif direction.x == 0:
		new_dir = Vector2.UP if direction.y < 0 else Vector2.DOWN
	if new_dir == cardinal_direction:	return false;	
	
	cardinal_direction = new_dir;
	return true;

	
func update_animation(state:String)-> void:
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
