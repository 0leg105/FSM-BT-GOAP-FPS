extends Node3D

@onready var fsm_visualizer: Window = $Window

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("debug_menue_switch"):
			fsm_visualizer.visible = not fsm_visualizer.visible
