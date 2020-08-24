extends CanvasLayer

signal scene_changed()



onready var animation_player = $AnimationPlayer
onready var black = $Control/Black
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func fade_out():
	animation_player.play("Fade")
	yield(animation_player, "animation_finished")
	
func fade_in():
	animation_player.play_backwards("Fade")
	yield(animation_player, "animation_finished")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
