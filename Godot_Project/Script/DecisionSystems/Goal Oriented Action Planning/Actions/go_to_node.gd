extends GoapAction
class_name GoToNode

@export var goap_planner: GoapPlanner
@export var fsm: FiniteStateMachine
@export var move_component: MoveComponent
@export var patrol_component: PatrolComponent
@export var cover_component: CoverComponent
const TOLERANCE: float = 1.2

func get_cost() -> int:
	return 0

func is_valid() -> bool:
	if state_manager.get_state("at_target"):
		return false
	var goal: String = goap_planner.get_current_goal().get_goal_name()
	match goal:
		"KillEnemy":
			return cover_component.check_current_cover()
		"SearchEnemy":
			return true
		"Patrol":
			return patrol_component.get_patrol_nodes_size() > 0
	return false
	
func get_preconditions() -> Dictionary:
	return {}

func get_effects() -> Dictionary:
	return {"player_block_visited": true, "at_patrol_node": true, "at_cover_node": true}

func update(_delta: float) -> bool:
	var goal: String = goap_planner.get_current_goal().get_goal_name()
	match goal:
		"SearchEnemy":
			state_manager.set_state("next_pos", character_body.get_global_coordinator().get_player_block_pos())
			state_manager.set_state("look_pos",state_manager.get_state("next_pos"))
		"Patrol":
			state_manager.set_state("next_pos", patrol_component.get_patrol_node_pos())
			state_manager.set_state("look_pos",state_manager.get_state("next_pos"))
		"KillEnemy":
			state_manager.set_state("next_pos", cover_component.get_cover_node().global_transform.origin)
			state_manager.set_state("look_pos",state_manager.get_state("last_seen_player_pos"))
		_:
			push_error("No match found")
	var target_position = state_manager.get_state("next_pos")
	if character_body.global_transform.origin.distance_to(target_position) >= TOLERANCE:
		move_component.go_to_position(target_position)
	else:
		move_component.arrived_at_node()
		return true
	return false
