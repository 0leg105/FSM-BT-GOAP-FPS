extends Node
class_name Action

var action_name : String
var preconditions : Dictionary
var effects : Dictionary
var cost : int

func _init(action_name: String, preconditions: Dictionary, effects: Dictionary, cost: int):
	self.action_name = action_name
	self.preconditions = preconditions
	self.effects = effects
	self.cost = cost

func get_cost():
	return self.cost

func get_action_name() -> String:
	return self.action_name

func get_effects() -> Dictionary:
	return self.effects

func get_preconditions() -> Dictionary:
	return self.preconditions
