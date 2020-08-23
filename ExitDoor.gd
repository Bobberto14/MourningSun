extends Area2D

export(String, FILE, "*.tscn") var nextScene
# Called when the node enters the scene tree for the first time.
func _ready():
	connect("body_entered", self, "_area_entered")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _area_entered(body):
	print("Level beaten")
	$SceneChanger.fade_out()
	yield($SceneChanger/AnimationPlayer, "animation_finished")
	get_tree().change_scene(nextScene)
 
