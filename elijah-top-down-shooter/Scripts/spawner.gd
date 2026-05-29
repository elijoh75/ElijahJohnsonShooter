extends Node2D

@onready var enemy = preload("res://Scenes/Enemy.tscn")
@onready var spawn_timer = $Timer # Make sure this matches your Timer's node name exactly

const WAVE_SIZE: int = 3 
const SPAWN_DELAY: float = 3

func _on_timer_timeout() -> void:
	# 1. STOP the timer immediately so it doesn't interrupt us
	spawn_timer.stop()
	
	# 2. Run the loop with the delays
	for i in range(WAVE_SIZE):
		spawn_single_enemy()
		
		if i < WAVE_SIZE - 1:
			await get_tree().create_timer(SPAWN_DELAY).timeout

	# 3. START the timer again only AFTER the whole wave is finished
	spawn_timer.start()

func spawn_single_enemy() -> void:
	var ene = enemy.instantiate()
	ene.position = position
	get_parent().get_node("Enemies").add_child(ene)
