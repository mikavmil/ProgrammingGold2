extends Node2D

@onready var gameover_label:Label = $CameraController/CanvasLayer/Label

func _on_ground_body_entered(body: Node2D) -> void:
	globals.gameover = true
	gameover_label.visible = true
	print("game over")
