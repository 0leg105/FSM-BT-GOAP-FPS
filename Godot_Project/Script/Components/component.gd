extends Node3D
class_name Component

var character_body: Npc
var state_manager: StateManager

func _enter_tree() -> void:
	character_body = get_parent()
	state_manager = character_body.get_state_manager()
