extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
# func _ready():


onready var player = $Player
onready var knight = $Knight
onready var label = $Label

var screen_size

func _ready():
	screen_size = player.screen_size


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var a = knight.get_position()
	var b = player.get_position()
	var dist = a.distance_to(b)
	var speed
	label.set_text(str(dist))
	knight.update_light(dist)
	
	

	
	if Input.is_action_pressed("sing"):
		a = (player.get_position() - knight.get_position()).normalized() * knight.speed
			
#		if a.x > b.x:
#			a.x -= 1
#		elif a.x < b.x:
#			a.x += 1
#		if a.length() > 0:
#			a = a.normalized() * knight.speed
		knight.position.x += a.x * delta
		knight.position.x = clamp(knight.position.x, 0, screen_size.x)
		#knight.position.x = clamp(position.x, 0, screen_size.x)
#
#
#
#	if velocity.length() > 0:
##		velocity = velocity.normalized() * speed
#	position += velocity * delta
#	position.x = clamp(position.x, 0, screen_size.x)
#	position.y = clamp(position.y, 0, screen_size.y)
		
		
		
		
		
		
		
		

func new_game():
	$Player.start($PlayerPosition.position)
	$Knight.start($KnightPosition.position)
	$StaticBody2D.start($StaticBody2DPosition.position)
