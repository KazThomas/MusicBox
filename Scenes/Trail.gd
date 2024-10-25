class_name Trail
extends Line2D

const MAX_POINTS: int = 2000

@onready var curve:= Curve2D.new()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	curve.add_point(get_parent().position)
	if curve.get_baked_points().size() > MAX_POINTS:
		curve.remove_point(0) #will remove the first point of the curve
	points = curve.get_baked_points()

func stop():
	set_process(false)
	var tween := get_tree().create_tween()
	tween.tween_property(self, "modulate:a", 0.0, 2.5)
	await tween.finished
	queue_free()
	
static func create() -> Trail: #static so it can be accessed in other scripts
	var scene = preload("res://Scenes/trail.tscn")
	return scene.instantiate()
