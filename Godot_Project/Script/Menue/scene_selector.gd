extends CenterContainer

@onready var scene_label: Label = $VBoxContainer/Label
@onready var sub_viewport: SubViewport = $VBoxContainer/CenterContainer/SubViewportContainer/SubViewport
@export var scene_text: String

var instanced_scene: Node

signal scene_selected(scene)

@export var scene: PackedScene:
	set(value):
		if not value:
			return
		scene = value
		if not sub_viewport:
			return
		if instanced_scene:
			sub_viewport.remove_child(instanced_scene)
			instanced_scene.queue_free()
		instanced_scene = scene.instantiate()
		instanced_scene.process_mode = Node.PROCESS_MODE_DISABLED
		sub_viewport.audio_listener_enable_2d = false
		sub_viewport.audio_listener_enable_3d = false
		sub_viewport.add_child(instanced_scene)

func _ready() -> void:
	scene = scene
	scene_label.text = scene_text

func _on_texture_button_pressed() -> void:
	scene_selected.emit(scene)
