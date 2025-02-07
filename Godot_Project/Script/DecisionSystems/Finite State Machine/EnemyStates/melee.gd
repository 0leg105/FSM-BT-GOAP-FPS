extends State
class_name Melee

@export var melee_component: MeleeComponent

func enter():
	pass

func exit():
	pass

func update(delta:float):
	state_manager.set_state("look_pos", state_manager.get_state("last_seen_player_pos"))
	var meleed: bool = melee_component.melee_player()
	fsm.change_state(self, "Alert")
