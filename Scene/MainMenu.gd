extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Play_pressed():
	Global.Point = 0
# warning-ignore:return_value_discarded
	get_tree().change_scene("res://Scene/World.tscn");
