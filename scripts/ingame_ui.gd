extends Control

var health = 100
var score_value = 0
@onready var score_value_text = %ScoreValueText
@onready var test_progress = %TestProgress

var path = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	path = get_tree().get_root().get_node("GameLevel").get_node("EnemyPath")
	path.connect("do_damage", _taken_damage)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_increase_score_pressed():
	score_value += 1
	score_value_text.text = str(score_value)

func _on_take_damage_pressed():
	health -= 10
	if(health <= 0):
		health = 100
	test_progress.value = health
	
func _taken_damage(damage):
	health -= damage
	test_progress.value = health
	if(health <= 0):
		get_tree().change_scene_to_file("res://ui/mainmenu/MainMenu.tscn")
	
