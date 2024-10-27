class_name StateMachine extends Node

@export var block: block

var has_child_states: bool = false

var parent_state: StateMachine
var current_state: StateMachine
var default_state: StateMachine
var previous_state: StateMachine


func _ready() -> void:
	if get_child_count() <= 0: return
	has_child_states = true
	
	default_state = get_child(0)
	current_state = default_state
	
	for child in get_children():
		var child_state: StateMachine = child
		child_state.parent_state = self
	

func enter_state_machine() -> void:
	enter()
	
	if not has_child_states: return
	current_state.enter_state_machine()

func enter() -> void:
	pass

func exit_state_machine() -> void:
	exit()
	
	if not has_child_states: return
	current_state.exit_state_machine()

func exit() -> void:
	pass

func change_state(new_state: StateMachine) -> void:
	
	current_state.exit_state_machine()
	previous_state = current_state
	
	new_state.enter_state_machine()
	current_state = new_state

func process_physics_state_machine() -> void:
	process_physics()
	
	if not has_child_states: return
	current_state.process_physics_state_machine()

func process_physics() -> void:
	pass
