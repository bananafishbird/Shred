extends State


@export var idle: State
@export var jumping: State
@export var falling: State


func unhandled_input(event):
	if controller.action_state("jump") == "pressed":
		get_parent().change_state(jumping)
	else:
		if controller.input_vector() == Vector3.ZERO:
			get_parent().change_state(idle)


func physics_process(delta):
	movement.accelerate()
	movement.gravitate()
	movement.move()
