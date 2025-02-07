extends LabelInfo
class_name LabelInfoBT

@export var state_manager: StateManager 
@onready var label: Label = $SubViewport/Label
var current_leaf: String = ""

func _process(_delta: float) -> void:
	label.text = "current_leaf: " + str(current_leaf) + "\n" \
	+ "-------------------------" + "\n" \
	+ "healthpoints: " + str(state_manager.get_state("healthpoints")) + "\n" \
	+ "bullets: " + str(state_manager.get_state("bullets")) + "\n" \
	+ "player_visible: " + str(state_manager.get_state("player_visible")) + "\n" \
	+ "at_target: " + str(state_manager.get_state("at_target")) + "\n" \
	+ "player_block_visited: " + str(state_manager.get_state("player_block_visited")) + "\n" \
	+ "at_cover_node: " + str(state_manager.get_state("at_cover_node")) + "\n"

func set_current_leaf(leaf) -> void:
	self.current_leaf = leaf
