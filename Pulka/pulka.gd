extends StaticBody2D

const speed: int = 100
var selected_number

func _ready():
	var random_number = RandomNumberGenerator.new()
	random_number.randomize() 
	selected_number = random_number.randi_range(1, 4)
	
func _physics_process(delta):
	if selected_number == 1:
		var motion = Vector2.UP * speed * delta
		var collision = move_and_collide(motion)
		if collision:
			queue_free()
	elif selected_number == 2:
		var motion = Vector2.DOWN * speed * delta
		var collision = move_and_collide(motion)
		if collision:
			queue_free()
	elif selected_number == 3:
		var motion = Vector2.LEFT * speed * delta
		var collision = move_and_collide(motion)
		if collision:
			queue_free()
	elif selected_number == 4:
		var motion = Vector2.RIGHT * speed * delta
		var collision = move_and_collide(motion)
		if collision:
			queue_free()

func destroy():
	queue_free()

func _on_area_2d_body_entered(player):
	if player.has_method("destroy") and not player.has_been_destroyed:
		player.destroy()
