extends Node
class_name GoapGoal

var state_manager: StateManager

func _enter_tree() -> void:
	var character_body: Npc = get_parent().get_parent().get_parent()
	state_manager = character_body.get_state_manager()

func is_valid() -> bool:
	return true

func get_goal_name() -> String:
	return name

func get_priority() -> int:
	return 0

func get_desired_state() -> Dictionary:
	return {}
