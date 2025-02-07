extends GoapGoal
class_name SearchEnemy

func is_valid() -> bool:
	return not state_manager.get_state("player_block_visited") and not state_manager.get_state("player_visible")

func get_priority() -> int:
	return 3

func get_desired_state() -> Dictionary:
	return {"player_block_visited": true }
