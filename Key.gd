extends Area2D


func _ready():
	connect("body_entered", self, "_area_entered")
	connect("body_exited", self, "_area_exited")
	hide()

var inside = false
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

#func reveal():
#	if inside:
#		$Sprite.show()


func _area_entered(body):
	inside = true
	print ("entering")

func _area_exited(body):
	inside = false
	print ("exiting")
