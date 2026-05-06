extends CharacterBody2D
class_name Enemy

@onready var animplayer = $AnimationPlayer

var player: Player = null

var speed: float = 100.0
var direction := Vector2.ZERO

var hit_points: int = 3

func _process(delta: float) -> void:
	if player !=null:
		look_at(player.global_position)

func _physics_process(delta: float) -> void:
	if player != null:
		var enemey_to_player = (player.global_position - global_position)
		if enemey_to_player.length() > 50.0:
			direction = enemey_to_player.normalized()
		else:
			direction = Vector2.ZERO
		
		
		if direction != Vector2.ZERO:
			velocity = speed * direction
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
			velocity.y = move_toward(velocity.y, 0, speed)
		
		move_and_slide()

func _on_player_detector_body_entered(body: Node2D) -> void:
	if body is Player:
		if player == null:
			player = body
			print(name + " found the player")


func _on_player_detector_body_exited(body: Node2D) -> void:
	if body is Player:
		if player != null:
			player = null
			print(name + " lost the player")

func take_damage(amount: int):
	if amount > 0:
		hit_points -= amount
		
		animplayer.play("take_damage")
		if hit_points <= 0:
			print("enemy died")
			queue_free()
