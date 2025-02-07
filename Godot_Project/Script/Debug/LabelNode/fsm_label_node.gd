extends LabelInfo
class_name LabelInfoFSM

@export var state_manager: StateManager
@onready var label: Label = $SubViewport/Label
var current_state: String

func _process(_delta: float) -> void:
	label.text = "current_state: " + str(current_state) + "\n" \
	+ "-------------------------" + "\n" \
	+ "healthpoints: " + str(state_manager.get_state("healthpoints")) + "\n" \
	+ "bullets: " + str(state_manager.get_state("bullets")) + "\n" \
	+ "player_visible: " + str(state_manager.get_state("player_visible")) + "\n" \
	+ "player_block_visited: " + str(state_manager.get_state("player_block_visited")) + "\n" \
	+ "at_target: " + str(state_manager.get_state("at_target")) + "\n" \
	+ "at_cover_node: " + str(state_manager.get_state("at_cover_node")) + "\n"

func set_current_state(state) -> void:
	self.current_state = state.name
