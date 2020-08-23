extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
# func _ready():


onready var player = $Player
onready var knight = $Knight
onready var key = $Key
onready var keydoor = $KeyDoor
onready var label = $KeyNote
onready var lever = $Lever
onready var leverdoor = $LeverDoor

var screen_size
var a
var b
var dist
var speed
var key_distance
var door_distance
var has_key = false

func _ready():
	screen_size = player.screen_size
	key.hide()
	label.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	a = knight.get_position()
	b = player.get_position()
	dist = a.distance_to(b)
	if has_key == false and dist < 120 and key.inside:
		key.show()
	else:
		key.hide()
	$DarkBackground.modulate.a = (dist-50)/100
	$Knight.update_light(dist)
	if Input.is_action_pressed("sing"):
		a = (player.get_position() - knight.get_position()).normalized() * knight.speed
		knight.move_and_slide(a, Vector2(0, 0))
	if Input.is_action_just_pressed("interact"):
		if lever.inside:
			leverdoor.open()
			lever.flip()
		elif b.distance_to(Vector2(44, 72)) < 16:
			key.hide()
			has_key = true
			label.show()
		elif b.distance_to(Vector2(72, 144)) < 32:
			keydoor.open()
			label.hide()

func new_game():
	$Player.start($PlayerPosition.position)
	$Knight.start($KnightPosition.position)
	$StaticBody2D.start($StaticBody2DPosition.position)