class_name PlayerCharacter
extends Character


func _ready():
	states.ready()


func _physics_process(delta):
	states.physics_process()
