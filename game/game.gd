extends Node2D

@export var pipes_scene: PackedScene

@onready var pipes_holder = $PipesHolder
@onready var spawn_up = $SpawnUp
@onready var spawn_lower = $SpawnLower
@onready var spawn_timer = $SpawnTimer

@onready var engine_sound = $EngineSound
@onready var game_over_sound = $GameOverSound


# Called when the node enters the scene tree for the first time.
func _ready():
	GameManager.set_score(0)
	GameManager.on_game_over.connect(on_game_over) #Recieve the signal from the died plane,
	#execute the local on_game_over
	
	spawn_pipes()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func spawn_pipes() -> void: 
	var y_pos = randf_range(spawn_up.position.y, spawn_lower.position.y) # Random float range
	var new_pipes = pipes_scene.instantiate() #To create new pipes
	
	new_pipes.position = Vector2(spawn_lower.position.x, y_pos)
	pipes_holder.add_child(new_pipes)

func _on_spawn_timer_timeout():
	spawn_pipes()

func on_game_over():
	stop_pipes()
	engine_sound.stop()
	game_over_sound.play()

func stop_pipes():
	spawn_timer.stop()
	for pipe in pipes_holder.get_children():
		pipe.set_process(false)

#func _on_planer_died():
#	GameManager.load_main_scene()

