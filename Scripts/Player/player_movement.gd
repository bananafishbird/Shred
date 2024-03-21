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
@export var jump_brake: float # *gravity to brake jump when button is released
@export var air_control: float # *acceleration for air movement

var target_velocity: Vector3 = Vector3.ZERO


func accelerate():
	target_velocity.x += controller.move_vector.x * acceleration
	target_velocity.z += controller.move_vector.z * acceleration


func gravitate():
	if not character.is_on_floor():
		target_velocity.y -= gravity


func move():
	var was_on_floor = character.is_on_floor()
	
	character.velocity = target_velocity
	character.move_and_slide()
	
	var is_on_floor = character.is_on_floor()
	if !was_on_floor and is_on_floor:
		now_on_floor.emit()
	elif was_on_floor and !is_on_floor:
		now_in_air.emit()


func jump():
	target_velocity.y = jump_impulse


func stop_jumping():
	target_velocity.y -= gravity * jump_brake


func air_accelerate():
	target_velocity.x += controller.move_vector.x * acceleration * air_control
	target_velocity.z += controller.move_vector.z * acceleration * air_control
