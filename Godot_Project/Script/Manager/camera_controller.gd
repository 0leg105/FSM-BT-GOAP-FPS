extends Node

@onready var player = get_tree().get_nodes_in_group("Player")[0]
@onready var camera2: Camera3D = $Camera3D
var camera1: Camera3D
var pause: bool = false

func _ready() -> void:
	var head = player.get_node("Head")
	camera1 = head.get_node("Camera3D")

func _unhandled_input(event: InputEvent) -> void:
	if Input.is_action_just_pressed("camera_switch"):
		switch_cameras()
	if event.is_action_pressed("pause_game"):
		pause_game()

func pause_game() -> void:
	pause = !pause
	if pause:
		Engine.time_scale = 0
	else:
		Engine.time_scale = 1
	
func switch_cameras() -> void:
	if camera1 != null and camera2 != null: # Überprüfe, ob die Kameras existieren
		if camera1.current:
			camera1.current = false
			camera2.current = true
		else:
			camera1.current = true
			camera2.current = false
	else:
		pass
