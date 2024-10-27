class_name block extends RigidBody2D

@export var state_machine: StateMachine

var movement_input: float

func _ready() -> void:
	state_machine.enter_state_machine()

func _physics_process(delta: float) -> void:
	movement_input = Input.get_action_strength("right") - Input.get_action_strength("left") 
	
	state_machine.process_physics_state_machine()
