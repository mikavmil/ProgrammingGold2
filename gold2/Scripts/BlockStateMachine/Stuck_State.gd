class_name Stuck_State_Machine extends StateMachine

func enter() -> void:
	block.sleeping = true
	globals.block_froze.emit()
