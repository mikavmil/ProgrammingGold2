class_name Controlled_State_Machine extends StateMachine

@export_category("States")
@export var idle_state: Idle_State_Machine

func enter() -> void:
	change_state(idle_state)
