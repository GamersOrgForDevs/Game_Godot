extends Control

var health_value = 100

@onready var test_progress = %TestProgress


var char = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	char = get_tree().get_root().get_node("GameLevel").get_node("NightPlayer")
	char.connect("update_healthbar", _update_healthbar)

	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_take_damage_pressed():
	health_value -= 10
	if(health_value <= 0):
		health_value = 100
	test_progress.value = health_value
	
func _update_healthbar(new_health):
	health_value = new_health
	test_progress.value = health_value

	
