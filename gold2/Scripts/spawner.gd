class_name Spawner extends Node2D

var block = preload("res://Scenes/shapes/Block.tscn")
var rectangle = preload("res://Scenes/shapes/rectangle.tscn")
var tshape = preload("res://Scenes/shapes/Tshape.tscn")
var lshape = preload("res://Scenes/shapes/Lshape.tscn")
#var whatshape = preload("res://Scenes/shapes/whatshape.tscn") i dont like this shape but im not going to remove it

var current_block : block

@export var blocks : Node
@export var camera_controller : CameraController


func _ready() -> void:
	globals.block_froze.connect(on_block_froze_received)
	globals.highest_shape_height = 300
	spawn_shape()

func spawn_shape() -> void:
	if globals.gameover: return
	
	var shapes = [block, rectangle, tshape, lshape]
	var rand_index:int = randi() % shapes.size() - 1
	
	var selected_shape = shapes[rand_index]

	current_block = selected_shape.instantiate()
	current_block.position = position
	
	if (camera_controller.position.y - 200) < (globals.highest_shape_height - 200):
		current_block.position.y = camera_controller.position.y - 200
	else:
		current_block.position.y = globals.highest_shape_height - 200
	
	current_block.set_color()
	
	blocks.add_child(current_block)

func on_block_froze_received():
	var highest_in_children: float = 300
	
	for child in blocks.get_children():
		var shape: block = child
		
		if shape.global_position.y < highest_in_children:
			highest_in_children = shape.global_position.y
	
	
	globals.highest_shape_height = highest_in_children
	
	spawn_shape()
