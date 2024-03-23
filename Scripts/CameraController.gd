extends Camera2D


var min_zoom : float = 1.0
var max_zoom : float = 15.0
var movement_speed : float = 1.0

func _input(event) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_WHEEL_UP:
			if zoom.x < max_zoom:
				zoom.x += 0.1
				zoom.y += 0.1

		
		if event.button_index == MOUSE_BUTTON_WHEEL_DOWN:
			if zoom.x > min_zoom:
				zoom.x -= 0.1
				zoom.y -= 0.1

		
		if event.button_index == MOUSE_BUTTON_MIDDLE:
			global_position = get_global_mouse_position()

func _process(delta) -> void:
	if Input.is_action_pressed("scroll"):
		global_position = get_global_mouse_position()
