class_name PlayerController
extends Node

## Player inputs


var input_vector: Vector3 = Vector3.ZERO


func _input(event):
	input_vector.x = Input.get_axis("move_left", "move_right")
	input_vector.z = Input.get_axis("move_backward", "move_forward")


func input_state(action: String) -> String:
	if Input.is_action_just_pressed(action):
		return "pressed"
	elif Input.is_action_just_released(action):
		return "released"
	elif Input.is_action_pressed(action):
		return "held"
	else:
		return "off"
	
