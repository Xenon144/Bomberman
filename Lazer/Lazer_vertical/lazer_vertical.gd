extends StaticBody2D

func _on_area_2d_body_entered(body):
	if body.has_method("destroy"): 
		body.destroy()

func _on_animated_sprite_2d_animation_finished():
	queue_free()
	
func _on_area_2d_2_body_entered(player):
	if player.has_method("destroy") and not player.has_been_destroyed:
		player.destroy()
