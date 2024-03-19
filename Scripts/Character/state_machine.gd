class_name StateMachine
extends Node


var current: State
var previous: State
@export var starting_state: State


func ready():
	pass


func physics_process():
	pass


func change(new_state: State):
	previous = current
	previous.exit()
