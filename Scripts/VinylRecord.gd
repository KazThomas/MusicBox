extends RigidBody2D

var screen_width := get_viewport_rect().size.x
var moveSpeed : int = 5

func _ready():
	position = Vector2(get_viewport_rect().size.x/2, get_viewport_rect().size.y/2)
	
func _input(event):
	var vinyl_record := $"."
	
	if event.is_action_pressed("add_layer"):
		#move_toward(-position.x, screen_width,moveSpeed)
		vinyl_record.self_modulate.a = 50
