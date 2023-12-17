extends CharacterBody2D

@export var moveSpeed : float = 100

signal update_healthbar(health)
signal update_mana(mana)
signal update_coins(coins)

var health = 100
var mana = 100
var coins = 30

var enemypath = 0

func _ready():
	enemypath = get_tree().get_root().get_node("GameLevel").get_node("EnemyPath")
	enemypath.connect("do_damage", _taken_damage)

func _process(_delta):
	if(health <= 0):
		get_tree().change_scene_to_file("res://ui/mainmenu/MainMenu.tscn")

func _physics_process(_delta):
	#Set input direction
	var inputDirection = Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)
	#Update Velocity
	velocity = inputDirection * moveSpeed
	
	#character direction animation control
	if Input.is_action_pressed("right"):
		get_node("AnimatedSprite2D").set_flip_h(false)
		$AnimatedSprite2D.play("Running L+R")
	elif Input.is_action_pressed("left"):
		get_node("AnimatedSprite2D").set_flip_h(true)
		$AnimatedSprite2D.play("Running L+R")
	elif Input.is_action_pressed("up") or Input.is_action_pressed("down"):
		get_node("AnimatedSprite2D").set_flip_h(false)
		$AnimatedSprite2D.play("Running U+D")
	else:
		$AnimatedSprite2D.play("Idle")
	
	#Dummy spend money button
	if Input.is_action_just_pressed("use_mana_standin"):
		if mana >= 15:
			mana -= 15
			update_mana.emit(mana)
	if Input.is_action_pressed("charge_mana_standin"):
		mana += 0.5
		if(mana >= 100):
			mana = 100
		elif(mana <= 0):
			mana = 0
		update_mana.emit(mana)
	if Input.is_action_just_pressed("purchase_standin"):
		coins -= 1
		if coins <= 0:
			coins = 0
		update_coins.emit(coins)
	if Input.is_action_just_pressed("earn_standin"):
		coins += 1
		update_coins.emit(coins)
	#Dummy spend mana button
	
	#Move and SLide function uses velocity of character body to move character on map
	move_and_slide()

func _taken_damage(damage):
	health -= damage
	print("Damage Taken " + str(damage))
	update_healthbar.emit(health)
