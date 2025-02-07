extends Node
class_name State

var state_name: String
var fsm
var character_body: CharacterBody3D
var state_manager: StateManager

func _enter_tree() -> void:
	fsm = get_parent()
	character_body = get_parent().get_parent()
	if character_body.is_in_group("Enemy"):
		state_manager = character_body.get_state_manager()

func enter():
	pass

func exit():
	pass

func update(_delta:float):
	pass
