@tool
extends GraphNode
class_name FSMNode

@export var action_on: Array[FSMNode]
@onready var textrue_rect: TextureRect = $TextureRect
@onready var label: Label = $TextureRect/Label
@onready var default_circle = load("res://Textures/circle.png")
@onready var green_circle = load("res://Textures/green_circle.png")
@onready var triangle_left = load("res://Textures/dreieck_links.png")
@onready var triangle_right = load("res://Textures/dreieck_rechts.png")
var is_green: bool = false

func _ready() -> void:
	set_slot(0,true,0, Color.BLACK, true, 0 ,Color.BLACK, triangle_right, null)
	textrue_rect.texture = default_circle
	label.text = str(self.title)
	#for fsm_node in action_on:

func switch_circle_image() -> void:
	is_green = !is_green
	if is_green:
		textrue_rect.texture = green_circle
	else:
		textrue_rect.texture = default_circle

func get_action_on_array() -> Array[FSMNode]:
	return self.action_on
