extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var inside

# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_area_entered")
	connect("body_exited", self, "_area_exited")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _area_entered(body):
	inside = true
	print("entering")


func _area_exited(body):
	inside = false
	print("exiting")

func _process(delta):
	if inside and Input.is_action_just_pressed("interact"):
		print("opening")
