extends Control


onready var tween = $Tween

func Muncul():
	tween.interpolate_property(self,"rect_position:y",-232,-8,0.5,Tween.TRANS_LINEAR);
	tween.start()


func _on_World_Death():
	Muncul()
