extends TileMap

@export var game_of_life : GameOfLife


func _ready() -> void:
	if is_instance_valid(game_of_life):
		game_of_life.step_incresed.connect(render)
		game_of_life.block_added.connect(render)
		

func render() -> void:
	clear()
	for i in game_of_life.blocks:
		set_cell(0,i,0,Vector2i(0,0))
		pass

