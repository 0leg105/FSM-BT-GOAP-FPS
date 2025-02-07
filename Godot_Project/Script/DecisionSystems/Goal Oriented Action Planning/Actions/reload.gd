extends GoapAction
class_name Reload

@export var shoot_component: ShootComponent

func get_cost() -> int:
	return 1

func is_valid() -> bool:
	return true

func get_preconditions() -> Dictionary:
	return {}

func get_effects() -> Dictionary:
	return {"bullets": true}

func update(_delta: float) -> bool:
	state_manager.set_state("look_pos",state_manager.get_state("last_seen_player_pos"))
	shoot_component.reload_gun()
	if state_manager.get_state("bullets"):
		return true
	return false
