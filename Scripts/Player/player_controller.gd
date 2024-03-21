class_name PlayerController
extends Node

## Player inputs


@export var pivot: Node

var move_vector: Vector3 = Vector3.ZERO
var is_moving: bool


func _input(event):
	move_vector.x = Input.get_axis("move_left", "move_right")
	move_vector.z = Input.get_axis("move_forward", "move_backward")
	
	if move_vector != Vector3.ZERO:
		is_moving = true
		pivot.basis = Basis.looking_at(move_vector.normalized())
	else:
		is_moving = false


func action_state(action: String) -> String:
	if Input.is_action_just_pressed(action):
		return "pressed"
	elif Input.is_action_just_released(action):
		return "released"
	elif Input.is_action_pressed(action):
		return "held"
	else:
		return "off"
	
