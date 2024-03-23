extends CanvasLayer

@export var game_of_life : GameOfLife
@onready var start_button : Button = $Panel/CenterContainer/GridContainer/Start
@onready var steps_number_label : Label = $Panel/CenterContainer/GridContainer/StepsNumber
@onready var simulation_speed_slider : HSlider = $Panel/CenterContainer/GridContainer/HSlider

func _process(delta) -> void:
	if is_instance_valid(game_of_life):
		steps_number_label.text = str(game_of_life.steps)
		game_of_life.simulation_speed = simulation_speed_slider.value * -1

func _on_next_step_pressed():
	if is_instance_valid(game_of_life):
		game_of_life.next_step()
		
		

func _on_start_pressed():
	if is_instance_valid(game_of_life):
		game_of_life.start_simulation()
		
		start_button.text = "Start"
		if game_of_life.is_simulation_started:
			start_button.text = "Stop"
		
		
func _on_reset_pressed():
	if is_instance_valid(game_of_life):
		game_of_life.reset()
