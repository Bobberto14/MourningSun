extends KinematicBody2D

func update_light(dist):
	var brightness = 100/dist
	$Light2D.set_energy(brightness)
