extends CharacterBody2D

signal bullet_shot(bullet_scene, location)

@onready var firingHole = $FiringHole

var bullet_scene = preload("res://levels/bullet.tscn")

var attack_speed = 0
var shoot_time = 0

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	look_at(get_global_mouse_position())
	#if (shoot_time == attack_speed):
		#shoot_time = 0
		#shoot()
	#else:
		#shoot_time += _delta
	if (Input.is_action_just_pressed("shoot")):
		shoot()

# Called when the node enters the scene tree for the first time.
func _ready():
	attack_speed = 1.5
	shoot_time = 0

func shoot():
	bullet_shot.emit(bullet_scene, firingHole.global_position)
