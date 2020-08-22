extends KinematicBody2D

export var speed = 50
const GRAVITY = 200.0
var velocity = Vector2()

func update_light(dist):
	var brightness
	if dist > 200:
		brightness = 0
	else:
		brightness = (200/dist)-1
	$Light2D.set_energy(brightness)

func _physics_process(delta):
	velocity.y += delta * GRAVITY

	var motion = velocity * delta
	move_and_collide(motion)
