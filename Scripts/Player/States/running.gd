extends State


@export var idle: State
@export var jumping: State
@export var falling: State


func enter():
	pass


func exit():
	pass


func unhandled_input(event):
	if controller.action_state("jump") == "pressed":
		get_parent().change_state(jumping)
	else:
		if !controller.is_moving:
			get_parent().change_state(idle)


func physics_process(delta):
	movement.accelerate()
	movement.gravitate()
	movement.move()
