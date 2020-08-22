extends KinematicBody2D

signal hit
export var speed = 75

var screen_size

func _ready():
	screen_size = get_viewport_rect().size

func _process(delta):
	if Input.is_action_pressed("ui_down"):
		move_and_collide(Vector2(0, speed) * delta)
	if Input.is_action_pressed("ui_up"):
		move_and_collide(Vector2(0, -speed) * delta)
	if Input.is_action_pressed("ui_right"):
		move_and_collide(Vector2(speed, 0) * delta)
	if Input.is_action_pressed("ui_left"):
		move_and_collide(Vector2(-speed, 0) * delta)

func start(pos):
	position = pos
	show()
	$CollisionShape2D.disabled = false
