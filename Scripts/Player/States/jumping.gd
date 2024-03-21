extends State


@export var idle: State
@export var running: State
@export var falling: State


func enter():
	movement.jump()


func exit():
	pass


func unhandled_input(event):
	if controller.action_state("jump") == "released":
		movement.stop_jumping()


func physics_process(delta):
	movement.accelerate()
	
	if controller.action_state("jump") == "released" or controller.action_state("jump") == "off":
		movement.stop_jumping()
	else:
		movement.gravitate()
	
	if character.velocity.y > 0:
		get_parent().change_state(falling)
	
	movement.move()
	
	if character.is_on_floor():
		if character.velocity.x == 0:
			get_parent().change_state(idle)
		else:
			get_parent().change_state(running)
