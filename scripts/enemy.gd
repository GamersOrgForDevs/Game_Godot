extends PathFollow2D

signal end_of_path(damage)

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if self.progress_ratio == 1:
		end_of_path.emit(5)
		queue_free()
