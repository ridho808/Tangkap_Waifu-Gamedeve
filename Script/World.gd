extends Node2D

onready var RemPath = preload("res://Scene/Rem.tscn");
onready var PoopPath = preload("res://Scene/Poop.tscn");
onready var KaguyaPath = preload("res://Scene/Kaguya.tscn");
onready var AsunaPath = preload("res://Scene/asuna.tscn");
onready var Poop2Path = preload("res://Scene/Poop2.tscn");
onready var KaoriPath = preload("res://Scene/Kaori.tscn");
onready var AstolfoPath = preload("res://Scene/Astolfo.tscn");
onready var KurumiPath = preload("res://Scene/kurumi.tscn");
onready var NajimiPath = preload("res://Scene/Najimi.tscn");
onready var AraAra = $AudioStreamPlayer2
onready var animation = $RemSpawn/AnimationPlayer;
onready var animationPoop = $PoopSpawn/AnimationPlayer;
onready var animationPoop2 = $PoopSpawn2/AnimationPlayer;
onready var animationKaguya = $KaguyaSpawn/AnimationPlayer;
onready var animationAsuna = $AsunaSpawn/AnimationPlayer;
onready var animationKaori = $KaoriSpawn/AnimationPlayer;
onready var animationAstolfo =$AstolfoSpawn/AnimationPlayer;
onready var animationKurumi = $KurumiSpawn/AnimationPlayer;
onready var animationNajimi = $NajimiSpawn/AnimationPlayer
onready var Point_canvas = $CanvasLayer/Poin/HBoxContainer/Label2;
onready var Player = $Player
onready var PlayerAnimation = $Player/AnimationPlayer
onready var PlayerAnima2 = $Player/AnimationTree
signal Death
onready var Point_Final = $Gui/Death/Label2;

func _ready():
	animation.play("RemSpawn");
	animationPoop.play("Poop_Spawn");
	animationPoop2.play("Poop_Spawn2");
	animationKaguya.play("Kaguya_Spawn");
	animationAsuna.play("Asuna_spawn");
	animationKaori.play("Kaori_");
	animationAstolfo.play("Astolfo_spawn");
	animationKurumi.play("Kurumi_spawn");
	animationNajimi.play("Najimi_spawn");
	Spawn_Rem();
	Spawn_Poop();
	Spawn_Kaguya();
	Spawn_Asuna()
	Spawn_Poop2();
	Spawn_Kaori();
	Spawn_Astolfo();
	Spawn_Kurumi();
	Spawn_Najimi();
# warning-ignore:unused_argument
#func _process(delta):
#	pass
#

func Death():
	Player.set_collision_layer_bit(0,false);
	Player.set_collision_mask_bit(1,false)
	Player.set_physics_process(false)
	PlayerAnima2.active = false
	PlayerAnimation.play("Death")

func Spawn_Najimi():
	var Najimi = NajimiPath.instance()
	Najimi.connect("body_entered",self,"Najimi_on_Player");
	self.call_deferred("add_child",Najimi)
	Najimi.position = $NajimiSpawn.position;

func Spawn_Kurumi():
	var Kurumi = KurumiPath.instance()
	Kurumi.connect("body_entered",self,"kurumi_on_player");
	self.call_deferred("add_child",Kurumi);
	Kurumi.position = $KurumiSpawn.position;

func Spawn_Kaori():
	var Kaori = KaoriPath.instance()
	Kaori.connect("body_entered",self,"_Kaori_on_Player");
	self.call_deferred("add_child",Kaori);
	Kaori.position = $KaoriSpawn.position;

func Spawn_Rem():
# warning-ignore:unused_variable
	var rem = RemPath.instance()
# warning-ignore:return_value_discarded
	rem.connect("body_entered",self,"_Rem_on_player")
	self.call_deferred("add_child",rem)
	rem.position = $RemSpawn.position;

func Spawn_Asuna():
	var Asuna = AsunaPath.instance();
	Asuna.connect("body_entered",self,"Asuna_on_Player");
	self.call_deferred("add_child",Asuna)
	Asuna.position = $AsunaSpawn.position

func Spawn_Astolfo():
	var Astolfo = AstolfoPath.instance();
	Astolfo.connect("body_entered",self,"Astolfo_on_Player");
	self.call_deferred("add_child",Astolfo);
	Astolfo.position = $AstolfoSpawn.position

func Spawn_Poop():
# warning-ignore:unused_variable
	var Poop = PoopPath.instance()
# warning-ignore:return_value_discarded
	Poop.connect("body_entered",self,"_Poop_on_player")
	self.call_deferred("add_child",Poop)
	Poop.position = $PoopSpawn.position;

func Spawn_Poop2():
# warning-ignore:unused_variable
	var Poop2 = Poop2Path.instance()
# warning-ignore:return_value_discarded
	Poop2.connect("body_entered",self,"_Poop_on_player2")
	self.call_deferred("add_child",Poop2)
	Poop2.position = $PoopSpawn2.position;
	
func Spawn_Kaguya():
	var Kaguya = KaguyaPath.instance();
	Kaguya.connect("body_entered",self,"_Kaguya_on_player")
	self.call_deferred("add_child",Kaguya);
	Kaguya.position = $KaguyaSpawn.position;

# warning-ignore:unused_argument
func _on_Delete_Objct_area_entered(area):
	if area.name == "Rem":
		self.call_deferred("remove_child",get_node("Rem"));
		Spawn_Rem()
	if area.name == "Poop":
		self.call_deferred("remove_child",get_node("Poop"));
		Spawn_Poop()
	if area.name == "Kaguya":
		self.call_deferred("remove_child",get_node("Kaguya"));
		Spawn_Kaguya()
	if area.name == "asuna":
		self.call_deferred("remove_child",get_node("asuna"));
		Spawn_Asuna()
	if area.name == "Poop2":
		self.call_deferred("remove_child",get_node("Poop2"));
		Spawn_Poop2()
	if area.name == "Kaori":
		self.call_deferred("remove_child",get_node("Kaori"));
		Spawn_Kaori();
	if area.name == "Astolfo":
		self.call_deferred("remove_child",get_node("Astolfo"));
		Spawn_Astolfo()
	if area.name == "kurumi":
		self.call_deferred("remove_child",get_node("kurumi"));
		Spawn_Kurumi()
	if area.name == "Najimi":
		self.call_deferred("remove_child",get_node("Najimi"));
		Spawn_Najimi()

func _Kaguya_on_player(body):
	if body.name == "Player":
		$AudioStreamPlayer2.play()
		Global.Point += 1
		Point_canvas.text = String(Global.Point);
		self.call_deferred("remove_child",get_node("Kaguya"))
		Spawn_Kaguya();



func Najimi_on_Player(body):
	if body.name == "Player":
		self.call_deferred("remove_child",get_node("Najimi"));
		$AudioStreamPlayer.playing = false
		Death()
		$deathSound.playing = true
		yield(get_tree().create_timer(2),"timeout");
		$deathSound.stop()
# warning-ignore:return_value_discarded
		self.emit_signal("Death")
		Point_Final.text = String(Global.Point)
		

# warning-ignore:unused_variable
func Astolfo_on_Player(body):
	if body.name == "Player":
		self.call_deferred("remove_child",get_node("Astolfo"))
		$AudioStreamPlayer.playing = false
		Death()
		$deathSound.playing = true
		yield(get_tree().create_timer(2),"timeout");
		$deathSound.stop()
# warning-ignore:return_value_discarded
		self.emit_signal("Death")
		Point_Final.text = String(Global.Point)

func kurumi_on_player(body):
	if body.name == "Player":
		$AudioStreamPlayer2.play()
		Global.Point += 1
		Point_canvas.text = String(Global.Point);
		self.call_deferred("remove_child",get_node("kurumi"))
		Spawn_Kurumi()

func _Rem_on_player(body):
	if body.name == "Player":
		$AudioStreamPlayer2.play()
		Global.Point += 1
		Point_canvas.text = String(Global.Point);
# warning-ignore:unused_variable
		self.call_deferred("remove_child",get_node("Rem"))
		Spawn_Rem();

func _Poop_on_player(body):
	if body.name == "Player":
		self.call_deferred("remove_child",get_node("Poop"))
		Death()
		$AudioStreamPlayer.playing = false
		$deathSound.playing = true
		yield(get_tree().create_timer(2),"timeout");
		$deathSound.stop()
# warning-ignore:return_value_discarded
		self.emit_signal("Death")
		Point_Final.text = String(Global.Point)

func _Poop_on_player2(body):
	if body.name == "Player":
		self.call_deferred("remove_child",get_node("Poop2"))
		Death()
		$AudioStreamPlayer.playing = false
		$deathSound.playing = true
		yield(get_tree().create_timer(2),"timeout");
		$deathSound.stop()
# warning-ignore:return_value_discarded
		self.emit_signal("Death")
		Point_Final.text = String(Global.Point)

func Asuna_on_Player(body):
	if body.name == "Player":
		$AudioStreamPlayer2.play()
		Global.Point += 1
		Point_canvas.text = String(Global.Point)
		self.call_deferred("remove_child",get_node("asuna"))
		Spawn_Asuna()

func _Kaori_on_Player(body):
	if body.name == "Player":
		self.call_deferred("remove_child",get_node("Kaori"));
		Death()
		$AudioStreamPlayer.playing = false
		$deathSound.playing = true
		yield(get_tree().create_timer(2),"timeout");
		$deathSound.stop()
# warning-ignore:return_value_discarded
		self.emit_signal("Death")
		Point_Final.text = String(Global.Point)


func _on_Exit_pressed():
	Global.Point = 0
	get_tree().change_scene("res://Scene/MainMenu.tscn");
	


func _on_Retry_pressed():
	Global.Point = 0
	get_tree().change_scene("res://Scene/World.tscn");
