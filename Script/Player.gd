extends KinematicBody2D
var MAX_speed = 100;
const Acceleration = 500;
const Friction = 600;
var velocity = Vector2.ZERO;
onready var animation = $AnimationPlayer;
onready var animationtree = $AnimationTree;
onready var animationstate = animationtree.get("parameters/playback")


func _ready():
	pass



func _physics_process(_delta):
	var input_vector = Vector2.ZERO;
	input_vector.x = Input.get_action_strength("Right") - Input.get_action_strength("Left");
	input_vector.y = Input.get_action_strength("Down") - Input.get_action_strength("Up");
	input_vector = input_vector.normalized();
	
	if input_vector != Vector2.ZERO:
		animationtree.set("parameters/Idle/blend_position",input_vector);
		animationtree.set("parameters/Walk/blend_position",input_vector);
		animationstate.travel("Walk")
		velocity = velocity.move_toward(input_vector * MAX_speed,Acceleration * _delta)
	else :
		animationstate.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO,Friction * _delta);
	velocity = move_and_slide(velocity)


