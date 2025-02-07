extends GoapAction
class_name SearchCoverNode

@export var character_body: CharacterBody3D
@export var cover_component: CoverComponent

func _ready() -> void:
	cost = 1

func get_action_name() -> String: return "SearchCoverNode"

func get_cost() -> int:
	return self.cost

func is_valid() -> bool:
	return cover_component.get_cover()

func get_preconditions() -> Dictionary:
	return {}

func get_effect() -> Dictionary:
	return {"available_cover_node": true}

func perform(delta: float) -> bool:
	return true
