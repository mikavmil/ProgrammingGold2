class_name CameraTopStateMachine extends CameraStateMachine

@export var camera_following: CameraFollowingStateMachine


func _ready() -> void:
	globals.block_falling.connect(on_block_falling_received)

func process_camera():
	if not globals.highest_shape_height: return
	
	if globals.highest_shape_height >= 0:
		camera.global_position.y = lerp(camera.global_position.y,0.0, 0.1)
	else:
		camera.global_position.y = lerp(camera.global_position.y,globals.highest_shape_height, 0.1)
	

func on_block_falling_received() -> void:
	parent_state.change_state(camera_following)
