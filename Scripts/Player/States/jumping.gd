extends State


@export var idle: State
@export var running: State
@export var falling: State


func enter():
	character.velocity.y = movement.jump_impulse


func unhandled_input(event):
	pass


func physics_process(delta):
	movement.accelerate()
	movement.gravitate()
	movement.move()
