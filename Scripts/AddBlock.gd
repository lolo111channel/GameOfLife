class_name AddBlock extends Node2D

@export var tilemap : TileMap
@export var game_of_life : GameOfLife


func _input(event) -> void:
	if event is InputEventMouseButton:
		if is_instance_valid(tilemap) and is_instance_valid(game_of_life):
			var mouse_pos : Vector2 = get_global_mouse_position()
			var mouse_pos_on_map : Vector2i = tilemap.local_to_map(mouse_pos)
			
			if event.button_index == MOUSE_BUTTON_LEFT and event.is_pressed():
				game_of_life.add_block(mouse_pos_on_map)
			
			if event.button_index == MOUSE_BUTTON_RIGHT and event.is_pressed():
				game_of_life.remove_block(mouse_pos_on_map)
