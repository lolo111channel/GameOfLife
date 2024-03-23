class_name GameOfLife extends Node

@onready var timer : Timer = $Timer 

var steps : int = 0
var blocks : Array[Vector2i] = [

]


signal step_incresed
signal block_added

var directions : Array[Vector2] = [
	Vector2i(-1,-1),
	Vector2i(0,-1),
	Vector2i(1,-1),
	Vector2i(-1,1),
	Vector2i(0,1),
	Vector2i(1,1),
	Vector2i(-1,0),
	Vector2i(1,0)
]


var is_simulation_started : bool = false
var simulation_speed : float = 1.0

func start_simulation() -> void:
	is_simulation_started = !is_simulation_started
	
func _process(delta) -> void:
	if is_simulation_started:
		if timer.is_stopped():
			timer.start(simulation_speed)



func next_step() -> void:
	var new_blocks : Array[Vector2i]
	
	for i in blocks:
		for j in directions:
			var neighbour_pos : Vector2i = Vector2i(i.x + j.x, i.y + j.y)
			if get_neighbours_count(neighbour_pos) == 3:
				if !new_blocks.has(neighbour_pos):
					new_blocks.append(neighbour_pos)
		
		if get_neighbours_count(i) == 2 or get_neighbours_count(i) == 3:
			if !new_blocks.has(i):
				new_blocks.append(i)

	
	blocks.clear()
	blocks = new_blocks
	
	steps += 1
	emit_signal("step_incresed")


func add_block(value : Vector2i) -> void:
	if !blocks.has(value):
		blocks.append(value)
		emit_signal("block_added")


func remove_block(value : Vector2i) -> void:
	if blocks.has(value):
		blocks.erase(value)
		emit_signal("block_added")


func reset() -> void:
	blocks.clear()
	steps = 0
	emit_signal("block_added")


func get_neighbours_count(pos : Vector2i) -> int:
	var count : int = 0
	
	for i in directions:
		var pos_of_neighbour : Vector2i = Vector2i(pos.x + i.x,pos.y + i.y)
		if blocks.has(pos_of_neighbour):
			count += 1
	
	return count



func _on_timer_timeout():
	next_step()
