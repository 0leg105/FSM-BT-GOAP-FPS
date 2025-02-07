extends GoapAction

@export var character_body: CharacterBody3D
@export var look_at_component: LookAtComponent

func _ready() -> void:
	cost = 1

func get_action_name() -> String: return "lookAtPlayer"

func get_cost() -> int:
	return self.cost

func is_valid() -> bool:
	return true

func get_preconditions() -> Dictionary:
	return {"player_visible": true}

func get_effect() -> Dictionary:
	return {"player_on_sight": true}

#func perform(delta: float) -> void:
	#var player_on_sight: bool = look_at_component.look_at_pos(GlobalCoordinator.get_player_pos())
	#return player_on_sight
