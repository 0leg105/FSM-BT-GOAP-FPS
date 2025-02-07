extends GoapGoal
class_name Cover

@export var cover_component: CoverComponent

func _ready() -> void:
	desired_state = {"healed": true}
	goal_name = "Cover"

func is_valid() -> bool:
	var current_state = state_manager.get_current_state()
	if current_state.get_state("healthpoints") <= 50:
		state_manager.update_state("healed", false)
	if cover_component.check_current_cover():
		return true
	else:
		return cover_component.check_for_cover_node_in_cover_manager()

func get_goal_name() -> String:
	return self.goal_name

func get_priority() -> int:
	var current_state = state_manager.get_current_state()
	if current_state.get_state("healthpoints") <= 50:
		return 100
	return 0

func get_desired_state() -> Dictionary:
	return self.desired_state
