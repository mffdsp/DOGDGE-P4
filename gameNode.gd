extends Node

var arq = File.new()
onready var pont = get_node("pont")

func _ready():
	$CanvasLayer/AnimationPlayer.play("die")
	pass
	
func _process(delta):
	
	if Input.is_action_just_pressed("r"):
		get_tree().change_scene("res://Node.tscn")
		