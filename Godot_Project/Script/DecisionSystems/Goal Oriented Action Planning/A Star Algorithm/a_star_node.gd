extends Node
class_name AStarNode

var goal_states: Dictionary = {}
var current_state_of_goals: Dictionary = {}
var parent_node: AStarNode = null
var action: GoapAction = null
var f_cost: int = 0
var g_cost: int = 0

func _init(current_state_of_goals: Dictionary, goal_state: Dictionary, action: GoapAction, parent_node: AStarNode) -> void:
	self.current_state_of_goals = current_state_of_goals
	self.goal_states = goal_state
	self.action = action
	self.parent_node = parent_node

func get_unsatasfied_states() -> Array:
	var unsatasfied_states: Array = []
	for state in goal_states.keys():
		var goal_value: bool = goal_states[state]
		if not current_state_of_goals.has(state) or current_state_of_goals[state] != goal_value:
			unsatasfied_states.append(state)
	return unsatasfied_states

func apply_action_to_state(current_state: Dictionary, action: GoapAction) -> AStarNode:
	# Kopiert derzeitigen initial_state
	var new_current_state: Dictionary = current_state_of_goals.duplicate()
	var new_goal_state: Dictionary = goal_states.duplicate()
	# Geht die Preconditions der Aktionen durch
	for state in action.get_preconditions():
		var value: bool = action.get_preconditions()[state]
		# Sollte ein voraussetzbarer Zustand einer Aktion nicht bereits ein Zielzustand sein, so wird dieser zu den Zielzuständen hinzugefügt 
		if not new_goal_state.has(state):
			new_goal_state[state] = value
		new_current_state[state] = current_state[state]
	for state in action.get_effects():
		# Aktuallisierung des duplzierten neuen current_state mit den Effekten der Aktionen
		var value: bool = action.get_effects()[state]
		new_current_state[state] = value
	# Precondition der neuen Aktion müssen ebenfalls erfüllt werden und werden somit in den goal_state des Nodes hinzugefügt
	return AStarNode.new(new_current_state, new_goal_state, action, self)

func is_satisfied() -> bool:
	return get_unsatasfied_states().size() == 0

func set_g_cost(g_cost: int) -> void:
	self.g_cost = g_cost

func set_f_cost(f_cost: int) -> void:
	self.f_cost = f_cost

func get_g_score() -> int:
	return self.g_cost

func get_f_score() -> int:
	return self.f_cost

func get_action() -> GoapAction:
	return self.action

func get_parent_node() -> AStarNode:
	return self.parent_node

func get_goal_state() -> Dictionary:
	return self.goal_states
