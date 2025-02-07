extends GoapAction
class_name RangedAttackFromCover

@export var shoot_component: ShootComponent
@export var move_component: MoveComponent
@export var cover_component: CoverComponent

func get_cost() -> int:
	return move_component.get_path_length(cover_component.get_cover_node().global_transform.origin)

func is_valid() -> bool:
	if cover_component.check_current_cover():
		return true
	else:
		return cover_component.check_for_cover_node_in_cover_manager()

func get_preconditions() -> Dictionary:
	return {"player_visible": true, "at_cover_node": true, "bullets": true}

func get_effects() -> Dictionary:
	return {"player_eliminated": true}

func update(_delta: float) -> bool:
	state_manager.set_state("look_pos",state_manager.get_state("last_seen_player_pos"))
	shoot_component.shoot_player()
	return true
