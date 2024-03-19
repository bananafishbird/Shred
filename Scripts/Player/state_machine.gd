class_name StateMachine
extends Node


signal state_changed(old, new)

@onready var character: PlayerCharacter = owner
@export var controller: PlayerController
@export var movement: PlayerMovement
#@export var rig: Rig

@export var default_state: State
var current_state: State


func ready():
	for child in get_children():
		child.character = character
		child.movement = movement
		child.controller = controller
		#child.rig = rig
	
	change_state(default_state)
	current_state.enter()


func unhandled_input(event):
	current_state.unhandled_input(event)


func physics_process(delta):
	current_state.physics_process(delta)


func change_state(new_state: State):
	var old_state = current_state
	current_state = new_state
	current_state.enter()
	if old_state:
		state_changed.emit(old_state.name, new_state.name)
	else:
		state_changed.emit("null", new_state.name)
