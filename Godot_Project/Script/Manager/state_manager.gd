extends Node
class_name StateManager

var current_state: Dictionary = {}

func _enter_tree() -> void:
	self.set_state("healthpoints", 100)
	self.set_state("bullets", true)
	self.set_state("player_visible", false)
	self.set_state("player_eliminated", false)
	self.set_state("at_target", false)
	self.set_state("at_cover_node", false)
	self.set_state("player_block_visited", false)
	self.set_state("last_seen_player_pos", Vector3.ZERO)
	self.set_state("next_pos", Vector3.ZERO)
	self.set_state("look_pos",Vector3.ZERO)

func get_current_state() -> Dictionary:
	return self.current_state

func get_state(pName: String) -> Variant:
	return current_state.get(pName)

func set_state(pName: String, value) -> void:
	current_state[pName] = value
