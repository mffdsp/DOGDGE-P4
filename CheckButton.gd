extends CheckButton

var music_bus = AudioServer.get_bus_index("Music")
var sounds_bus = AudioServer.get_bus_index("Sounds")

func _ready():
	if self.release_focus():
		AudioServer.set_bus_volume_db(music_bus, 0)
	pass