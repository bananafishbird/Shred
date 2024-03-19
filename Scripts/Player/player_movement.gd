class_name PlayerMovement
extends Node


signal now_on_floor
signal now_in_air

@export var character: PlayerCharacter
@export var controller: PlayerController

@export var speed: float
@export var acceleration: float
@export var gravity: float
@export var jump_impulse: float
@export var jump_brake: float # gravity multiplier to brake jump when button is released
@export var air_control: float # acceleration multiplier for air movement

var target_velocity: Vector3 = Vector3.ZERO


func accelerate():
	target_velocity.x = controller.move_vector.x * speed
	target_velocity.z = controller.move_vector.z * speed


func gravitate():
	if not character.is_on_floor():
		target_velocity.y = target_velocity.y - gravity


func move():
	character.velocity = target_velocity
	character.move_and_slide()
