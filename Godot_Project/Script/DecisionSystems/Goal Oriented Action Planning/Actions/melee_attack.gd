extends GoapAction
class_name MeleeAttack

@export var melee_component: MeleeComponent

func get_cost() -> int:
	if state_manager.get_state("at_target"):
		return 1
	return 100

func is_valid() -> bool:
	return state_manager.get_state("at_target") or state_manager.get_state("player_visible")

func get_preconditions() -> Dictionary:
	return {"player_visible": true}

func get_effects() -> Dictionary:
	return {"player_eliminated": true}

func update(_delta: float) -> bool:
	state_manager.set_state("look_pos",state_manager.get_state("last_seen_player_pos"))
	melee_component.melee_player()
	return true
