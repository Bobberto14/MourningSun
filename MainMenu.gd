extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var title = $Title
onready var start = $CanvasLayer/StartButton
onready var credButton = $CanvasLayer/CreditsButton
onready var credits = $Credits
onready var back = $ReturnButton

# Called when the node enters the scene tree for the first time.
func _ready():
	credits.hide()
	back.hide()
	title.show()
	start.show()
	credButton.show()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Credits_Button_pressed():
	title.hide()
	start.hide()
	credButton.hide()
	credits.show()
	back.show()


func _on_Button_pressed():
	title.show()
	start.show()
	credButton.show()
	credits.hide()
	back.hide()
