extends Node2D

@export var highP := 0.3
@export var lowP := -0.3
var pitch: float = randf_range( lowP, highP)

#var beat = load("res://Scenes/Beat1Test.tscn").instantiate()

func _ready():
	$AudioStreamPlayer.pitch_scale += pitch
	$"1Beat".modulate = Color.DARK_CYAN


