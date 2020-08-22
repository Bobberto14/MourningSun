extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
# func _ready():


onready var player = $Player
onready var knight = $Knight
onready var label = $Label


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var a = knight.get_position()
	var b = player.get_position()
	var dist = a.distance_to(b)
	label.set_text(str(dist))
	knight.update_light(dist)

func new_game():
	$Player.start($PlayerPosition.position)
	$Knight.start($KnightPosition.position)
