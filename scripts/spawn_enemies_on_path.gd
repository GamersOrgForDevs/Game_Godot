extends Path2D

@export var path_time : float = 6
@export var spawn_time : float = 0.5
var tween
var timer

const path_follow_obj = preload("res://objects/enemy.tscn")

signal do_damage(damage)
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	
	timer = Timer.new()
	add_child(timer)
	timer.connect("timeout", _on_timer_timeout)
	timer.set_wait_time(spawn_time)
	timer.set_one_shot(false)
	timer.start()
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_timer_timeout():
	var instance = path_follow_obj.instantiate()
	self.add_child(instance)
	instance.connect("end_of_path", _on_damage_take)
	tween = get_tree().create_tween()
	tween.bind_node(instance)
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.set_ease(Tween.EASE_IN_OUT)
	tween.tween_property(instance, "progress_ratio", 1, path_time)
	tween.set_loops(1)

func _on_damage_take(damage):
	print("Damage Taken " + str(damage))
	do_damage.emit(damage)
