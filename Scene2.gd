extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
# func _ready():


onready var player = $Player
onready var knight = $Knight
onready var lever = $Lever
onready var label = $Label
onready var door = $Door

var screen_size
var a
var b
var dist
var speed

func _ready():
	screen_size = player.screen_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	a = knight.get_position()
	b = player.get_position()
	dist = a.distance_to(b)
	$DarkBackground.modulate.a = (dist-50)/100
	$Knight.update_light(dist)
	if Input.is_action_pressed("sing"):
		a = (player.get_position() - knight.get_position()).normalized() * knight.speed
		knight.move_and_slide(a, Vector2(0, 0))
	if lever.inside and Input.is_action_just_pressed("interact"):
		door.open()
		lever.flip()

func new_game():
	$Player.start($PlayerPosition.position)
	$Knight.start($KnightPosition.position)
	$StaticBody2D.start($StaticBody2DPosition.position)