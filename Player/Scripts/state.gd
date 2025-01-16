class_name State extends Node

static var player: Player
@export var animation_image: Texture2D  

# Called when the node enters the scene tree for the first time.
func init() -> void:
	pass # Replace with function body.

## What happends on enter state
func enter_state() -> void:
	pass
	
func exit_state() ->void:
	pass
	
func update_state(_delta:float) -> State:
	return null;

func update_physics(_delta:float) -> State:
	return null
	
func handle_input(_event:InputEvent) ->State:
	return null
