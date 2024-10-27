class_name block extends RigidBody2D

@export var state_machine: StateMachine
@export var shape: Polygon2D

var movement_input: float

func _ready() -> void:
	state_machine.enter_state_machine()

func _physics_process(delta: float) -> void:
	movement_input = Input.get_action_strength("right") - Input.get_action_strength("left") 
	
	state_machine.process_physics_state_machine()

func set_color():
	shape.color = Color(randf_range(0.0,1.0),randf_range(0.0,1.0),randf_range(0.0,1.0))
