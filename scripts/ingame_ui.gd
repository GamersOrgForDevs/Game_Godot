extends Control

var health = 100
var score_value = 0
@onready var score_value_text = %ScoreValueText
@onready var test_progress = %TestProgress

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_increase_score_pressed():
	score_value += 1
	print(score_value)
	score_value_text.text = str(score_value)



func _on_take_damage_pressed():
	health -= 10
	if(health < 0):
		health = 100
	test_progress.value = health
	
