extends State
class_name InCover

@export var look_at_component: LookAtComponent
@onready var timer: Timer = $Timer

func enter():
	timer.start()
	label.text = character_body.name + " InCover"

func exit():
	timer.stop()
	label.text = ""

func update(delta: float):
	look_at_component.look_at_pos(character_body.get_player_pos())
	if character_body.get_player_visible():
		print(character_body.name, " InCover -> InCoverShoot")
		fsm.change_state(self,"InCoverShoot")

func _on_timer_timeout() -> void:
	if !character_body.get_player_visible():
		print(character_body.name," InCover -> SearchPlayer")
		fsm.change_state(self, "SearchPlayer")
