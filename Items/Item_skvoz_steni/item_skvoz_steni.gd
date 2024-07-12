extends StaticBody2D

const mob_luk = preload("res://Mobs/Mob_luk/mob_luk.tscn")

# Чтобы нельзя было брать итем, когда игроки могут ходить сквозь стены, а сам итем скрыт кирпичным блоком
func _on_area_2d_body_entered(body):
	var is_coordinate_in_array = false
	if body.name == "player" or body.name == "player_2":
		for coord in Global.coordinates_with_block_kirpich:
			if coord == Global.coordinate_item:
				is_coordinate_in_array = true
				break  # Если нашли совпадение, можно выйти из цикла
		# Если значение найдено в массиве, запускаем код
		if is_coordinate_in_array == false:
			Global.player_skvoz_steni = 72
			$Item_vzal.play()
#####################################################################			

func _on_item_vzal_finished():
	queue_free()
	$"../AudioStreamPlayer2D".stop()
	$"../AudioStreamPlayer2D2".play()
	
func destroy():
	$Timer.start()

func _on_timer_timeout():
	for i in range(4 * Global.more_enemy):
		var new_mob_luk = mob_luk.instantiate()
		get_parent().add_child(new_mob_luk)
		new_mob_luk.global_position = global_position
		Global.massiv_vse_sozdannie_mobi.append(new_mob_luk)	
	queue_free()
