extends Node2D

const SCROLL_SPEED: float = 120.0

@onready var score_sound = $ScoreSound

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x -= SCROLL_SPEED * delta

func player_score() -> void:
	score_sound.play()
	GameManager.increment_score()

func _on_screen_exited():
	queue_free() # To destroy the object o screen exit


func _on_pipe_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLANE) == true:
		body.die()

func _on_laser_body_entered(body):
	if body.is_in_group(GameManager.GROUP_PLANE) == true:
		player_score()
