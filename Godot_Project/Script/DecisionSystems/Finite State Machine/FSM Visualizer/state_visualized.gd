extends TextureRect
class_name VisualizedState

@onready var default_circle = load("res://Textures/circle.png")
@onready var green_circle = load("res://Textures/green_circle.png")
@onready var label: Label = $Label
var state_name: String
var is_green: bool = false

func _ready() -> void:
	self.texture = default_circle
	self.state_name = name
	self.label.text = state_name
	if not is_in_group("StateCircle"):
		add_to_group("StateCircle")

func switch_circle_image() -> void:
	is_green = !is_green
	if is_green:
		self.texture = green_circle
	else:
		self.texture = default_circle
