extends Area2D

@export var speed = 1000


var rotation_speed = 500
var rotation_direction = 0
@onready var spawn_position = global_position
@onready var target_position = get_global_mouse_position()

func _ready():
	# float
	position = global_position
	rotation_direction = (spawn_position) - (get_global_mouse_position())

func _physics_process(delta):
	if position != target_position:
		position = position.move_toward(target_position, delta * speed)
	else: 
		queue_free()
	#rotation += rotation_direction * rotation_speed * delta
	
func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
	
func get_firing_hole_location():
	# i cri 
	pass
