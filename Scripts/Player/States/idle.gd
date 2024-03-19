extends State


@export var running: State
@export var jumping: State
@export var falling: State


func unhandled_input(event):
	if controller.action_state("jump") == "pressed":
		get_parent().change_state(jumping)
	else:
		if controller.move_input().x != 0:
			get_parent().change_state(running)


func physics_process(delta):
	movement.accelerate()
	movement.gravitate()
	movement.move()
