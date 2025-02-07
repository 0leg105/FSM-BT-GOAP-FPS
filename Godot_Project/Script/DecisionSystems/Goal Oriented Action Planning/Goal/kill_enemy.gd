extends GoapGoal
class_name KillEnemy

func is_valid() -> bool:
	return (state_manager.get_state("at_target") or state_manager.get_state("player_visible")) and not state_manager.get_state("player_eliminated")

func get_priority() -> int:
	return 4

func get_desired_state() -> Dictionary:
	return {"player_eliminated": true}
