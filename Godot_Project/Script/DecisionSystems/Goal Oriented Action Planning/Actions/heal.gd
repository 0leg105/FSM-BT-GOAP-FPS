extends GoapAction
class_name Heal

@export var health_component: HealthComponent

func _ready() -> void:
	cost = 0

func get_action_name() -> String: return "Heal"

func get_cost() -> int:
	return cost

func is_valid() -> bool:
	return true

func get_preconditions() -> Dictionary:
	return {"at_cover_node": true}

func get_effects() -> Dictionary:
	return {"healed": true}

func perform(_delta: float) -> bool:
	return health_component.heal()
