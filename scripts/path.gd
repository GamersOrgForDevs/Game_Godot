extends Path2D

@onready var follow = get_node("follow")

@export var path_time : float = 6

var tween
# Called when the node enters the scene tree for the first time.
func _ready():
	set_process(true)
	tween = get_tree().create_tween()
	tween.bind_node(follow)
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(follow, "progress_ratio", 1, 2)
	tween.connect("finished", on_tween_finish)
	tween.set_loops()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func on_tween_finish():
	print("DOne")
