extends Control

var health_value = 100
var mana_value = 100
var score_value = 0

@onready var score_value_text = %ScoreValueText
@onready var test_progress = %TestProgress
@onready var mana_progress = %ManaProgress

var char = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	char = get_tree().get_root().get_node("GameLevel").get_node("ExamplePlayer")
	char.connect("update_healthbar", _update_healthbar)
	char.connect("update_mana", _update_mana)
	char.connect("update_coins", _update_coins)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_increase_score_pressed():
	score_value += 1
	score_value_text.text = str(score_value)

func _on_take_damage_pressed():
	health_value -= 10
	if(health_value <= 0):
		health_value = 100
	test_progress.value = health_value
	
func _update_healthbar(new_health):
	health_value = new_health
	test_progress.value = health_value
func _update_mana(new_mana):
	mana_value = new_mana
	mana_progress.value = mana_value
func _update_coins(new_coins):
	score_value = new_coins
	score_value_text.text = str(score_value)
	
