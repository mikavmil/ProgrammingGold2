class_name CameraController extends Camera2D

@export var camera_state_machine: CameraStateMachine

func _ready() -> void:
	camera_state_machine.enter_state_machine()

func _process(delta: float) -> void:
	camera_state_machine.process_camera_state_machine()
