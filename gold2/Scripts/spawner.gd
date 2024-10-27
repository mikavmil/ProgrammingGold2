class_name Spawner extends Node2D

var block = preload("res://Scenes/Block.tscn")
var current_block : block

@export var level : Node2D


func _ready() -> void:
	globals.block_froze.connect(on_block_froze_received)
	globals.highest_shape_height = 0
	spawn_shape()

func spawn_shape() -> void:
	current_block = block.instantiate()
	current_block.position = position
	add_child(current_block)

func on_block_froze_received():
	var highest_in_children: float = 300
	
	for child in get_children():
		var shape: block = child
		
		if shape.global_position.y < highest_in_children:
			highest_in_children = shape.global_position.y
		print_debug(highest_in_children)
	
	
	globals.highest_shape_height = highest_in_children
	
	spawn_shape()
