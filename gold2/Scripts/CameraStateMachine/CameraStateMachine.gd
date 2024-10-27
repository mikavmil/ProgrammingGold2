class_name CameraStateMachine extends Node

@export var camera: Camera2D

var has_child_states: bool = false

var parent_state: CameraStateMachine
var current_state: CameraStateMachine
var default_state: CameraStateMachine
var previous_state: CameraStateMachine


func _ready() -> void:
	if get_child_count() <= 0: return
	has_child_states = true
	
	default_state = get_child(0)
	current_state = default_state
	
	for child in get_children():
		var child_state: CameraStateMachine = child
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

func change_state(new_state: CameraStateMachine) -> void:
	current_state.exit_state_machine()
	previous_state = current_state
	
	new_state.enter_state_machine()
	current_state = new_state

func process_camera_state_machine() -> void:
	process_camera()
	
	if not has_child_states: return
	current_state.process_camera_state_machine()

func process_camera() -> void:
	pass
