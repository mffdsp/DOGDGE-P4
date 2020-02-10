extends Area2D

var base = Vector2(1084,  int(rand_range(110, 156)))
var x_max = OS.window_size.x - 32;
var x_min = 32;
onready var person = get_parent().get_node("person")

var v =  Vector2(int(rand_range(-500, -100)),0)

var tempo = 0
func _ready():
	set_position(base)
	$AnimationPlayer.play("enemyA")
	print("CRIOU")
	#connect("area_shape_entered", person, "colidiu")
	pass

func _physics_process(delta):
	self.set_position(self.position + v * delta)
	
func colidiu(area):
	 if get_parent().immortal == 0:
	 	get_parent().dead = 1;