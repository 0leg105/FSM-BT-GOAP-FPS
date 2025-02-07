extends GoapGoal
class_name Patrol

func is_valid() -> bool:
	return not state_manager.get_state("player_visible")

func get_priority() -> int:
	return 2

func get_desired_state() -> Dictionary:
	return {"at_patrol_node": true}
