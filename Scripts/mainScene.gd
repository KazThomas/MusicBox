extends Node

@onready var layer := $Layer
@onready var roof := $Roof
@onready var point_1 = $spawnZone/point1
@onready var point_2 = $spawnZone/point2
@onready var vinyl_record = $VinylRecord

@onready var bankArray = [$Banks/Bank, $Banks/Bank2, $Banks/Bank3, $Banks/Bank4]

var canDrop : bool = false
var beat = load("res://Scenes/Beat1Test.tscn").instantiate() #vars can only be used in input func
var mouse_x

func _ready():
	print(bankArray[1]) #testing array works

func _input(event):
	mouse_x = get_viewport().get_mouse_position().x
	var tween = create_tween()
	if event.is_action_pressed("add_layer"): # 'activates' the game
		tween.tween_property(vinyl_record, "position", Vector2(1500, 500), 1.5)
		tween.tween_property(vinyl_record, "scale", Vector2(0.45, 0.45), 0.3)
		tween.tween_property(vinyl_record, "position", Vector2(576, 489), 1)
		await get_tree().create_timer(3).timeout
		layer.visible = true
		for bank in bankArray:
			bank.visible = true
	if layer.visible == true:
		canDrop = true
		if event.is_action_pressed("bankIt"): #only adds it to the first bank, need to find iteration
			remove_child(beat)
			beat.position = bankArray[0].position
			beat.freeze = true
			add_child(beat)
		if event.is_action_pressed("removeBank") && beat.position == bankArray[0].position: #not working yet
			remove_child(beat)
			beat.position.x = mouse_x
			add_child(beat)

func notesFalling():
	var beat = load("res://Scenes/Beat1Test.tscn").instantiate() #vars can only be used in input func
	var rest = load("res://Scenes/rest_beat.tscn").instantiate()
	var mouse_x = get_viewport().get_mouse_position().x
	var randomNote : int =  randi_range(1, 2)
	
	var y_pos = roof.position.y + 20
	if mouse_x >= point_1.position.x && mouse_x <= point_2.position.x:
		#replace this line ^ to detect if something is falling
		beat.position = Vector2(mouse_x, y_pos)
		rest.position = Vector2(mouse_x, y_pos)
		match  randomNote:
			1:
				add_child(beat)
			2:
				add_child(rest)

func _process(delta):
	if canDrop == true:
		notesFalling()	
	
# NEED TO CHECK IF OBJECT IS FALLING
# NEED TO SEE IF BANK IS HIGHLIGHTED
# NEED TO CHECK IF BANK IS OCCUPIED
# NEED TO CREATE A SWITCH STATEMENT TO RANDOMISE NOTE PLAYED
