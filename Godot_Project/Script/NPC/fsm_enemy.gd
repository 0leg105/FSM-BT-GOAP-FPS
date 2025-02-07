extends Npc
class_name FsmEnemy

var fsm: FiniteStateMachine

func _enter_tree() -> void:
	super._enter_tree()
	fsm = $FiniteStateMachine

func update(delta: float) -> void:
	look_at_component.look_at_pos(state_manager.get_state("look_pos"))
	vision_component.update()
	fsm.update(delta)
