extends GoapAction
class_name RangedAttack

@export var shoot_component: ShootComponent

func get_cost() -> int:
	return character_body.global_transform.origin.distance_to(character_body.get_global_coordinator().get_player_pos())

func is_valid() -> bool:
	return state_manager.get_state("player_visible")

func get_preconditions() -> Dictionary:
	return {"player_visible": true, "bullets": true}

func get_effects() -> Dictionary:
	return {"player_eliminated": true}

func update(_delta: float) -> bool:
	state_manager.set_state("look_pos",state_manager.get_state("last_seen_player_pos"))
	shoot_component.shoot_player()
	return true
