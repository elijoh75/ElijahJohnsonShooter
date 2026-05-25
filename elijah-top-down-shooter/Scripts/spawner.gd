extends Node2D

@onready var enemy = preload("res://Scenes/Enemy.tscn")



func _on_timer_timeout() -> void:
	var ene = enemy.instantiate()
	ene.position = position
	get_parent().get_node("Enemies").add_child(ene)
