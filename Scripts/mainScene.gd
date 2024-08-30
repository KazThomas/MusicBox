extends Node

@onready var layer := $Layer
@onready var roof := $Roof
@onready var point_1 = $spawnZone/point1
@onready var point_2 = $spawnZone/point2
@onready var vinyl_record = $VinylRecord

@onready var bankArray = [$Banks/Bank, $Banks/Bank2, $Banks/Bank3, $Banks/Bank4]



func _ready():
	print(bankArray[1]) #testing array works

func _input(event):
	var beat = load("res://Scenes/Beat1Test.tscn").instantiate() #vars can only be used in input func
	var mouse_x = get_viewport().get_mouse_position().x
	var tween = create_tween()
	if event.is_action_pressed("add_layer"): # 'activates' the game
		tween.tween_property(vinyl_record, "position", Vector2(1500, 500), 1.8)
		tween.tween_property(vinyl_record, "scale", Vector2(0.45, 0.45), 0.5)
		tween.tween_property(vinyl_record, "position", Vector2(576, 489), 1.2)
		await get_tree().create_timer(3.5).timeout
		layer.visible = true
		for bank in bankArray:
			bank.visible = true
	if layer.visible == true:
		if event.is_action_pressed("drop"):
			var y_pos = roof.position.y + 20
			if mouse_x >= point_1.position.x && mouse_x <= point_2.position.x:
				beat.position = Vector2(mouse_x, y_pos)
				add_child(beat)
		if event.is_action_pressed("bankIt"): #only adds it to the first bank, need to find iteration
			remove_child(beat)
			beat.position = bankArray[0].position
			beat.freeze = true
			add_child(beat)
		if event.is_action_pressed("removeBank") && beat.position == bankArray[0].position: #not working yet
			remove_child(beat)
			beat.position.x = mouse_x
			add_child(beat)

# NEED TO CHECK IF OBJECT IS FALLING
# NEED TO SEE IF BANK IS HIGHLIGHTED
# NEED TO CHECK IF BANK IS OCCUPIED
