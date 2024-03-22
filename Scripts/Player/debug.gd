extends Node


func _on_states_state_changed(old, new):
	$DebugUI/VBoxContainer/State.text = str(old, " --> ", new)


func _on_movement_now_in_air():
	$DebugUI/VBoxContainer/InAir.text = "AIR"


func _on_movement_now_on_floor():
	$DebugUI/VBoxContainer/InAir.text = "GROUND"


func _on_movement_velocity_update(target_velocity_x, target_velocity_z):
	$DebugUI/VBoxContainer/Movement/Velocity.text = str(
			"Velocity: ", 
			"x:", round(target_velocity_x), 
			", z:", round(target_velocity_z))


func _on_controller_move_vector_update(move_vector):
	$DebugUI/VBoxContainer/Controller/MoveVector.text = str(
			"Move Vector: ", move_vector.x, ", ", 
			move_vector.z)
