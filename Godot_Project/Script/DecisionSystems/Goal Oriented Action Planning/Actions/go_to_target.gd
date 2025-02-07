extends GoapAction
class_name GoToTarget

@export var move_component: MoveComponent

func _ready() -> void:
	cost = 0

func get_action_name() -> String: return "GoToTarget"

func get_cost() -> int:
	return self.cost

func is_valid() -> bool:
	return true

func get_preconditions() -> Dictionary:
	return {"player_visible": true}

func get_effect() -> Dictionary:
	return {"at_target": true}

func perform(delta: float) -> bool:
	var arrived: bool = move_component.go_to_position(delta, GlobalCoordinator.player.global_transform.origin, "at_target")
	if arrived:
		return true
	return false
