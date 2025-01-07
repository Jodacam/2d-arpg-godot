class_name PlayerStateMachine extends Node

var states : Array[State]
var pre_state: State
@export var current_state:State
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	process_mode = Node.PROCESS_MODE_DISABLED
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	change_state(current_state.update_state(delta))
	return
func _physics_process(delta: float) -> void:
	change_state(current_state.update_physics(delta))
	return
func _unhandled_input(event: InputEvent) -> void:
	change_state(current_state.handle_input(event));
	return
	
func initialize(_player:Player) -> void:
	states = []; 
	for c in get_children():
		if c is State :
			states.append(c)
	if states.size() > 0:
		states[0].player = _player;
		change_state(states[0]);
		process_mode = Node.PROCESS_MODE_INHERIT
	return

func change_state(new_state : State) -> void :
	if new_state == null || new_state == current_state : return
	if(current_state):
		current_state.exit_state();
	pre_state = current_state;
	current_state = new_state;
	current_state.enter_state();
	return
	
