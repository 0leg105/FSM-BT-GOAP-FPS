extends LabelInfo
class_name LabelInfoGOAP

@export var goap_planner: GoapPlanner
@export var state_manager: StateManager
@onready var label: Label = $SubViewport/Label
var current_action: GoapAction = GoapAction.new()

func update(_delta: float) -> void:
	label.text = "current_goal: " + goap_planner.get_current_goal().get_goal_name() + "\n" \
	+ "-------------------------" + "\n" \
	+ "current_action: " + current_action.get_action_name() + "\n" \
	+ "-------------------------" + "\n" \
	+ "healthpoints: " + str(state_manager.get_state("healthpoints")) + "\n" \
	+ "bullets: " + str(state_manager.get_state("bullets")) + "\n" \
	+ "player_visible: " + str(state_manager.get_state("player_visible")) + "\n" \
	+ "player_block_visited: " + str(state_manager.get_state("player_block_visited")) + "\n" \
	+ "at_target: " + str(state_manager.get_state("at_target")) + "\n" \
	+ "at_cover_node: " + str(state_manager.get_state("at_cover_node")) + "\n"

func set_current_action(current_action: GoapAction) -> void:
	self.current_action = current_action
