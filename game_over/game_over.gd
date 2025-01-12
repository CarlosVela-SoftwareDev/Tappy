extends Control

@onready var timer = $Timer
@onready var game_over_label = $GameOverLabel
@onready var press_space_label = $PressSpaceLabel

var _can_press_space: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.on_game_over.connect(on_game_over) #Recieve the signal from the died plane,
	#execute the local on_game_over


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _can_press_space == true:
		if Input.is_action_just_pressed("fly") == true:
			GameManager.load_main_scene()

func _on_timer_timeout():
	run_sequence()

func on_game_over() -> void:
	show()
	timer.start()


func run_sequence() -> void:
	game_over_label.hide()
	press_space_label.show()
	_can_press_space = true
