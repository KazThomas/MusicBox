extends Node2D

var current_trail: Trail

func _process(_delta):
	make_trail()

func make_trail():
	if current_trail:
		current_trail.stop()
	current_trail = Trail.create()
	add_child(current_trail)
