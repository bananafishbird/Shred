class_name PlayerCharacter
extends CharacterBody3D


@export var states: StateMachine


func _ready():
	states.ready()


func _unhandled_input(event):
	states.unhandled_input(event)


func _physics_process(delta):
	states.physics_process(delta)
