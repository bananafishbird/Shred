extends State


@export var idle: State
@export var running: State


func enter():
	pass


func exit():
	pass


func unhandled_input(event):
	pass


func physics_process(delta):
	movement.air_accelerate()
	movement.gravitate()
	movement.move()
	
	if character.is_on_floor():
		if controller.is_moving:
			get_parent().change_state(idle)
		else:
			get_parent().change_state(running)
