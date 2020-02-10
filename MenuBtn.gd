extends Button

func _ready():
	pass


func _process(delta):
	if self.is_pressed():
		get_tree().change_scene("res://mainMenu.tscn")
	if self.is_hovered():
		get_node("normal").hide()
		get_node("hover").show()
	else:
		get_node("normal").show()
		get_node("hover").hide()