extends StaticBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Open.hide()

func open():
	$CollisionShape2D.disabled = true
	$Closed.hide()
	$Open.show()
	$LightOccluder2D.light_mask = 4
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
