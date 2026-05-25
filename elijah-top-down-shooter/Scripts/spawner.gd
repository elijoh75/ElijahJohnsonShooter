extends Node2D

@onready var enemy = preload("res://Scenes/Enemy.tscn")

func _on_timer_timeout() -> void:
	# 1. Wait for a 2-second delay after the timer finishes
	await get_tree().create_timer(2.0).timeout
	
	# 2. Now run the enemy spawn code
	var ene = enemy.instantiate()
	ene.position = position
	get_parent().get_node("Enemies").add_child(ene)
	
	# 3. Manually restart the main timer so the loop continues
	$Timer.start()
