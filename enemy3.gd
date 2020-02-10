extends Area2D

var x_max = OS.window_size.x - 64;
var x_min = 64;
var y_max = OS.window_size.y - 64
var y_min = 64;
onready var person = get_parent().get_node("person")

var base = Vector2(int(rand_range(-1200, 60)),0)

var v =  Vector2(int(rand_range(-200,-500)), int(rand_range(300, 500)))

var tempo = 0

func _ready():
	set_position(base)
	
	print("CRIOU a macon")
	#connect("area_shape_entered", person, "colidiu")
	pass

func _physics_process(delta):
	self.set_position(self.position + v * delta)
	
func colidiu(area):
	 if get_parent().immortal == 0:
	 	get_parent().dead = 1;