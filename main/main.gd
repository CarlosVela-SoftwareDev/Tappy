extends Control

@onready var highscore_label = $MC/HC/HighscoreLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	highscore_label.text = str(GameManager.get_highscore())

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("fly") == true:
		GameManager.load_game_scene()
