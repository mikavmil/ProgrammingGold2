class_name CameraFollowingStateMachine extends CameraStateMachine

@export var camera_top: CameraTopStateMachine

func _ready() -> void:
	globals.block_froze.connect(on_block_stuck_received)

func process_camera():
	if not globals.falling_shape_height: return
	
	if camera.global_position.y >= 300:
		camera.global_position.y = lerp(camera.global_position.y,globals.falling_shape_height, 0.05)

func on_block_stuck_received() -> void:
	parent_state.change_state(camera_top)
