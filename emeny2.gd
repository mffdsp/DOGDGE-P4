extends Area2D

var x_max = OS.window_size.x - 64;
var x_min = 64;
onready var person = get_parent().get_node("person")

var base = Vector2(int(rand_range(x_min, x_max)), 0)

var v =  Vector2(0, int(rand_range(220, 600)))
var tempo = 0

func _ready():
	set_position(base)
	print("CRIOU a nayeon")
	#connect("area_shape_entered", person, "colidiu")
	pass

func _physics_process(delta):
	self.set_position(self.position + v * delta)
	
func colidiu(area):
	 if get_parent().immortal == 0:
	 	get_parent().dead = 1;