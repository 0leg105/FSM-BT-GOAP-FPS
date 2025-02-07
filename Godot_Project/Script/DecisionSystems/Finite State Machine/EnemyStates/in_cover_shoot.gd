extends State
class_name InCoverShoot

@export var shoot_component: ShootComponent

func enter():
	pass

func exit():
	pass

func update(delta: float):
	state_manager.set_state("look_pos", state_manager.get_state("last_seen_player_pos"))
	var shoot: bool = shoot_component.shoot_player()
	fsm.change_state(self, "Alert")
