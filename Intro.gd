extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var animatior = $AnimationPlayer


# Called when the node enters the scene tree for the first time.
func _ready():
	$block1.color = Color(0,0,0,1)
	$block2.color = Color(0,0,0,1)
	$block3.color = Color(0,0,0,1)
	$block4.color = Color(0,0,0,1)
	$block5.color = Color(0,0,0,1)
	$block6.color = Color(0,0,0,1)
	$block7.color = Color(0,0,0,1)
	$block8.color = Color(0,0,0,1)
	$block9.color = Color(0,0,0,1)
	$block10.color = Color(0,0,0,1)
	$block11.color = Color(0,0,0,1)
	$block12.color = Color(0,0,0,1)
	$Song.play()
	animatior.play("fade")
	

func _process(delta):
	if Input.is_action_pressed("ui_select"):
		get_tree().change_scene("res://Scene1.tscn")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
