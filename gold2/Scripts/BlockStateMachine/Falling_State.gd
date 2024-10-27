class_name Falling_State_Machine extends StateMachine

@export var stuck_state: Stuck_State_Machine

func enter() -> void:
	block.gravity_scale = 1
	
	
	globals.block_falling.emit()

func process_physics() -> void:
	if block.linear_velocity.length() <= 0.2:
		parent_state.change_state(stuck_state)
	
	print(block.global_position.y)
	globals.falling_shape_height = block.global_position.y
