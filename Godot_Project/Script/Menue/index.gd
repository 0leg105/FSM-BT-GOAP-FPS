extends Node2D

@onready var grid_container: GridContainer = $Label/GridContainer

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	for selector in grid_container.get_children():
		selector.scene_selected.connect(_on_scene_selected)

func _on_scene_selected(scene: PackedScene):
	get_tree().change_scene_to_file(scene.resource_path)
