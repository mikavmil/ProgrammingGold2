class_name Idle_State_Machine extends StateMachine

@export var main_state_machine: StateMachine
@export var moving_state_machine: Moving_State_Machine
@export var falling_state_machine: Falling_State_Machine

func enter() -> void:
	block.gravity_scale = 0

func process_physics() -> void:
	if block.movement_input != 0:
		parent_state.change_state(moving_state_machine)
	if Input.is_action_pressed("drop"):
		main_state_machine.change_state(falling_state_machine)
