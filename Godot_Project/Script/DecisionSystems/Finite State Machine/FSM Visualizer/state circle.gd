extends Node2D
class_name StateCircle

@onready var state_name: String = name
@export var transistions: Array[StateCircle]
@export var pos: Vector2

func _ready() -> void:
	if not is_in_group("StateCircle"):
		add_to_group("StateCircle")
