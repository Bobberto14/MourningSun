extends KinematicBody2D

export var speed = 50

func update_light(dist):
	var brightness
	if dist > 200:
		brightness = 0
	else:
		brightness = (200/dist)-1
	$Light2D.set_energy(brightness)
