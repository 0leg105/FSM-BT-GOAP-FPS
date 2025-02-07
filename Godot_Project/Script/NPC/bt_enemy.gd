extends Npc
class_name BtEnemy

@onready var behavior_tree: BehaviorTreeRoot = $BehaviorTreeRoot

func update(delta: float) -> void:
	look_at_component.look_at_pos(state_manager.get_state("look_pos"))
	vision_component.update()
	behavior_tree.update(delta)
