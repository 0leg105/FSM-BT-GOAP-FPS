extends Node
class_name PriorityQueue

var head: PriorityNode
var dict: Dictionary

func _init() -> void:
	head = null
	dict = {}

func new_node(data: Object, priority: int) -> PriorityNode:
	return PriorityNode.new(data, priority)

func peek() -> Object:
	if head != null:
		return head.get_data()
	return null

func pop() -> Object:
	var highest_head: PriorityNode = null
	if head != null:
		highest_head = head
		dict.erase(head.get_data())
		head = head.get_next()
	return highest_head.get_data()

func push(data: Object, priority: int) -> void:
	var temp = new_node(data, priority)
	if head == null or head.get_priority() > priority:
		temp.next = head
		head = temp
		dict[data] = null
	else:
		var start = head
		while start.get_next() != null and start.get_next().get_priority() > priority:
			start = start.get_next()
		temp.set_next(start.get_next())
		start.set_next(temp)
		dict[data] = null

func is_empty() -> bool:
	return head == null

func has(item) -> bool:
	return dict.has(item)

func get_plans() -> Array[AStarNode]:
	var plans: Array[AStarNode]
	var data = head
	while data != null:
		plans.append(data.get_data())
		data = data.get_next()
	return plans

#func clear() -> void:
	#for data in dict:
		#data.clear()
	#dict.clear()

class PriorityNode:
	var data: Object
	var priority: int
	var next: PriorityNode = null

	func _init(data : Object, priority: int) -> void:
		self.data = data
		self.priority = priority

	func get_priority() -> int:
		return priority

	func get_next() -> PriorityNode:
		return next

	func get_data() -> Object:
		return data

	func set_next(next : PriorityNode) -> void:
		self.next = next
