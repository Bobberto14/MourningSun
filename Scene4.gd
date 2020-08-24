extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
# func _ready():


onready var player = $Player
onready var knight = $Knight
onready var key = $Key
onready var door = $Door
onready var label = $KeyNote

var screen_size
var a
var b
var dist
var speed
var key_distance
var door_distance
var has_key = false
var volume

func _ready():
	screen_size = player.screen_size
	key.hide()
	label.hide()
	$MotherCall.hide()
	$MotherCall.set_text("What's that sparkling?")
	$ExitDoor/SceneChanger.fade_in()
	$Sounds/Ambience.play()
	$Sounds/Whine.play()
	$Sounds/Song.play()
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	a = knight.get_position()
	b = player.get_position()
	dist = a.distance_to(b)
	if has_key == false and dist < 100 and key.inside:
		key.show()
	else:
		key.hide()
	$Sounds/Whine.set_volume_db((dist*-1)+25)
	$DarkBackground.modulate.a = (dist-50)/100
	$Knight.update_light(dist)
	volume = $Sounds/Song.volume_db
	if Input.is_action_pressed("sing"):
		a = (player.get_position() - knight.get_position()).normalized() * knight.speed
		knight.move_and_slide(a, Vector2(0, 0))
		if volume < -60:
			$Sounds/Song.set_volume_db(-60)
		elif volume < -20:
			$Sounds/Song.set_volume_db(volume+.5)
		elif volume >= -20:
			$Sounds/Song.set_volume_db(-21)
		$MotherCall.show()
	else: 
		$MotherCall.hide()
		if volume > -80:
			$Sounds/Song.set_volume_db(volume -0.75)
	if Input.is_action_just_pressed("sing"):
		if $MotherCall.get_text() == "What's that sparkling?":
			$Voice1.play()
		else: $Voice2.play()
	if Input.is_action_just_pressed("interact"):
		if b.distance_to(Vector2(64, 68)) < 16:
			key.hide()
			$Sounds/KeyPickup.play()
			has_key = true
			label.show()
			$MotherCall.set_text("I hear you, Mother.")
		elif 124 > b.x and b.x > 88:
			if has_key:
				door.open()
				$Sounds/Door.play()
				label.hide()

func new_game():
	$Player.start($PlayerPosition.position)
	$Knight.start($KnightPosition.position)
	$StaticBody2D.start($StaticBody2DPosition.position)
