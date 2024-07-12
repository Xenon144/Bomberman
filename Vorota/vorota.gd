extends StaticBody2D

const mob_luk = preload("res://Mobs/Mob_luk/mob_luk.tscn")

func _on_area_2d_body_entered(body):
	var is_coordinate_in_array = false
	if body.name == "player" or body.name == "player_2":
		for coord in Global.coordinates_with_block_kirpich:
			if coord == Global.coordinate_vorota:
				is_coordinate_in_array = true
				break  
		# Если значение найдено в массиве, запускаем код
		if is_coordinate_in_array == false and Global.massiv_vse_sozdannie_mobi.size() == 0: # Если размер массива равен 0, то массив пустой. Значит мобов на карте нет и игрок может войти в ворота
			$"../AudioStreamPlayer2D".stop()
			$"../AudioStreamPlayer2D2".stop()
			Global.stage_nomer += 1
			Global.player_voshel_v_vorota = true
			$Stage_proydena.play()

func _on_stage_proydena_finished():
	Global.player_voshel_v_vorota = false
	if Global.stage_nomer > 15:
		Global.mob_pulki = false
		Global.novie_mobi = false
		Global.nagalKnopkuB = false
		Global.novie_mobi = false
		Global.nagalKnopkuB = false
		Global.Vkluchit_Zvuk_B = false
		Global.chislo_gizney = 6
		get_tree().change_scene_to_file("res://Menu_igra_proydena/menu_igra_proydena.tscn")
	else:
		Global.player_death = false
		Global.more_enemy = 1
		Global.vkluchit_Zvuk_B = false
		Global.massiv_vse_sozdannie_mobi.clear()
		Global.coordinates_with_block_kirpich.clear()
		Global.svobodnie_coordinates.clear()
		Global.massiav_s_b.clear()
		Global.massiav_s_b_player_2.clear()
		Global.massiv_nevidimiy_block.clear()
		Global.massiv_nevidimiy_block_player_2.clear()
		Global.massiv_kuda_ustanovlenna_poslednaa_b = []
		Global.massiv_kuda_ustanovlenna_poslednaa_b_player_2 = []
		Global.coordinate_kuda_ustanovlenna_poslednaa_b = null
		Global.coordinate_kuda_ustanovlenna_poslednaa_b_player_2 = null
		Global.sozdannih_b = 0 
		Global.sozdannih_b_player_2 = 0
		Global.massiv_block_mobi.clear()
		Global.kamenniy_block_s_blokami_ot_mobov = [
		Vector2(24, 120),
		Vector2(24, 168),
		Vector2(24, 216),
		Vector2(24, 264),
		Vector2(24, 312),
		Vector2(24, 360),
		Vector2(24, 408),
		Vector2(24, 456),
		Vector2(24, 504),
		Vector2(24, 552),
		Vector2(24, 168),
		Vector2(24, 600),
		Vector2(24, 648),
		Vector2(24, 696),
		
		Vector2(72, 696),
		Vector2(120, 696),
		Vector2(168, 696),
		Vector2(216, 696),
		Vector2(264, 696),
		Vector2(312, 696),
		Vector2(360, 696),
		Vector2(408, 696),
		Vector2(456, 696),
		Vector2(504, 696),
		Vector2(552, 696),
		Vector2(600, 696),
		Vector2(648, 696),
		Vector2(696, 696),
		Vector2(744, 696),
		Vector2(792, 696),
		Vector2(840, 696),
		Vector2(888, 696),
		Vector2(936, 696),
		Vector2(984, 696),
		Vector2(1032, 696),
		Vector2(1080, 696),
		Vector2(1128, 696),
		Vector2(1176, 696),
		Vector2(1224, 696),
		Vector2(1272, 696),
		Vector2(1320, 696),
		Vector2(1368, 696),
		Vector2(1416, 696),
		Vector2(1464, 696),
		
		Vector2(1464, 648),
		Vector2(1464, 600),
		Vector2(1464, 552),
		Vector2(1464, 504),
		Vector2(1464, 456),
		Vector2(1464, 408),
		Vector2(1464, 360),
		Vector2(1464, 312),
		Vector2(1464, 264),
		Vector2(1464, 216),
		Vector2(1464, 168),
		Vector2(1464, 120),
			
		Vector2(1416, 120),
		Vector2(1368, 120),
		Vector2(1320, 120),
		Vector2(1272, 120),
		Vector2(1224, 120),
		Vector2(1176, 120),
		Vector2(1128, 120),
		Vector2(1080, 120),
		Vector2(1032, 120),
		Vector2(984, 120),
		Vector2(936, 120),
		Vector2(888, 120),
		Vector2(840, 120),
		Vector2(792, 120),
		Vector2(744, 120),
		Vector2(696, 120),
		Vector2(648, 120),
		Vector2(600, 120),
		Vector2(552, 120),
		Vector2(504, 120),
		Vector2(456, 120),
		Vector2(408, 120),
		Vector2(360, 120),
		Vector2(312, 120),
		Vector2(264, 120),
		Vector2(216, 120),
		Vector2(168, 120),
		Vector2(120, 120),
		Vector2(72, 120),
		
		Vector2(120, 216),
		Vector2(216, 216),
		Vector2(312, 216),
		Vector2(408, 216),
		Vector2(504, 216),
		Vector2(600, 216),
		Vector2(696, 216),
		Vector2(792, 216),
		Vector2(888, 216),
		Vector2(984, 216),
		Vector2(1080, 216),
		Vector2(1176, 216),
		Vector2(1272, 216),
		Vector2(1368, 216),
		
		Vector2(120, 312),
		Vector2(216, 312),
		Vector2(312, 312),
		Vector2(408, 312),
		Vector2(504, 312),
		Vector2(600, 312),
		Vector2(696, 312),
		Vector2(792, 312),
		Vector2(888, 312),
		Vector2(984, 312),
		Vector2(1080, 312),
		Vector2(1176, 312),
		Vector2(1272, 312),
		Vector2(1368, 312),
		
		Vector2(120, 408),
		Vector2(216, 408),
		Vector2(312, 408),
		Vector2(408, 408),
		Vector2(504, 408),
		Vector2(600, 408),
		Vector2(696, 408),
		Vector2(792, 408),
		Vector2(888, 408),
		Vector2(984, 408),
		Vector2(1080, 408),
		Vector2(1176, 408),
		Vector2(1272, 408),
		Vector2(1368, 408),
		
		Vector2(120, 504),
		Vector2(216, 504),
		Vector2(312, 504),
		Vector2(408, 504),
		Vector2(504, 504),
		Vector2(600, 504),
		Vector2(696, 504),
		Vector2(792, 504),
		Vector2(888, 504),
		Vector2(984, 504),
		Vector2(1080, 504),
		Vector2(1176, 504),
		Vector2(1272, 504),
		Vector2(1368, 504),
		
		Vector2(120, 600),
		Vector2(216, 600),
		Vector2(312, 600),
		Vector2(408, 600),
		Vector2(504, 600),
		Vector2(600, 600),
		Vector2(696, 600),
		Vector2(792, 600),
		Vector2(888, 600),
		Vector2(984, 600),
		Vector2(1080, 600),
		Vector2(1176, 600),
		Vector2(1272, 600),
		Vector2(1368, 600)]
		get_tree().change_scene_to_file("res://Menu_nomer_stage/menu_nomer_stage.tscn")

func destroy():
	$Timer.start()
	
func _on_timer_timeout():
	for i in range(4 * Global.more_enemy):
		var new_mob_luk = mob_luk.instantiate()
		get_parent().add_child(new_mob_luk)
		new_mob_luk.global_position = global_position
		Global.massiv_vse_sozdannie_mobi.append(new_mob_luk)
