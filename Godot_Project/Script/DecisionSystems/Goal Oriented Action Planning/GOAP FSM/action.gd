extends State
class_name GoapFSMAction

var current_plan_step: int = 0
var current_plan: Array = []
var current_action: GoapAction

func update(delta: float) -> void:
	# Hat sich der Plan geändert so wird der neue Plan übernommen
	if current_plan != character_body.get_action_sequence():
		current_plan = character_body.get_action_sequence()
		current_plan_step = 0
	# Sollte derzeitiger Plan leer, fertig durchgeführt oder nicht umsetzbar sein, soll ein neuer Plan erstellt werden
	if current_plan.is_empty() or current_plan_step >= current_plan.size() or current_plan[current_plan_step] == null or not current_plan[current_plan_step].is_valid():
		character_body.set_create_plan(true)
		return
	current_action = current_plan[current_plan_step]
	fsm.set_goap_label_action(current_action) #Debugging
	var action_completeted : bool = current_action.update(delta)
	if action_completeted:
		current_plan_step += 1
	return
