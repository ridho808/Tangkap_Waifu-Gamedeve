extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimationPlayer.play("Kaori")

# Called every frame. 'delta' is the elapsed time since the previous frame.
# warning-ignore:unused_argument
func _process(delta):
	position.y -=1.6
