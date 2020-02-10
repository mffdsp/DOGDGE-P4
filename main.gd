extends Node

onready var pont = get_parent().get_node("pont2")
onready var enemy = self.get_node("enemy")

var EnemyScn = preload("res://enemy.tscn")
var EnemyScn2 = preload("res://enemy2.tscn")
var EnemyScn3 = preload("res://enemy3.tscn")

var arq = File.new()
var tempo = 0
var spawn = 3
var pontos = 0
var best = 0
var dead = 0
var ponto_r = 0
var tempo_total = 0
var tempo2 = 0;
var immortal = 0
var dif3 = 0

func _ready():
	
	$mainMusic.play()
	arq.open("save.txt", File.READ_WRITE)
	arq.seek(0)
	print("inicio")
	ponto_r = arq.get_var()
	if(ponto_r != 0):
		print("AAAAAAA")
		best = int(ponto_r)
	pass

func _process(delta):
	
	
	tempo += delta;
	tempo2 += delta;
	tempo_total += delta
	pontos += delta * 5
	dif3 += delta;
	
	if(pontos > best):
		best = int(pontos)
	pont.text = str("PONTUAÇÃO: ", str(str(int(pontos)), "\nRECORD: "), str(best));
	
	var newEnemy = EnemyScn.instance()
		
	var newEnemy2 = EnemyScn2.instance()
	
	var newEnemy3 = EnemyScn3.instance()
	
	if tempo >= spawn:
		tempo = 0
		#dificuldade
		self.add_child(newEnemy3)
		self.add_child(newEnemy)
		
	elif(tempo2 >= 5 && tempo_total > 10):
		newEnemy3 = EnemyScn3.instance()
		
		print('d2')
		tempo2 = 0 
		
		self.add_child(newEnemy)
		self.add_child(newEnemy2)
		self.add_child(newEnemy3)
		
		if(dif3 >= 12):
			newEnemy3 = EnemyScn2.instance()
			self.add_child(newEnemy3)
			newEnemy3 = EnemyScn2.instance()
			print("DIF39")
		if(dif3 >= 20):
			newEnemy3 = EnemyScn.instance()
			self.add_child(newEnemy3)
			print("DIF310")
				
		if(dif3 >= 30):
			newEnemy3 = EnemyScn3.instance()
			self.add_child(newEnemy3)
			newEnemy3 = EnemyScn3.instance()
			self.add_child(newEnemy3)
			print("DIF3")
			dif3 = 0
		
		if(tempo_total > 20):
			newEnemy2 = EnemyScn2.instance()
			self.add_child(newEnemy2)
		
	if(dead == 1):
		if(pontos > best):
			arq.seek(0)
			arq.store_var(pontos)
			arq.close()
		dead = 0
		get_tree().change_scene("res://gameNode.tscn")