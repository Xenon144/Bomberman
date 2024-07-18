extends CharacterBody2D

const bomb_player_2 = preload("res://Bomb_player_2/b_player_2.tscn")
const nevidimiy_block_player_2 = preload("res://Nevidimiy_block/nevidimiy_block.tscn")
var has_been_destroyed: bool = false # false - функция destroy() не вызывалась. 
var ShagiGorizontal: bool = false # Чтобы звук перемещения по горизонтали запускался 1 раз при нажатии на клавишу
var ShagiVertical: bool = false # Чтобы звук перемещения по вертикали запускался 1 раз при нажатии на клавишу

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var left: String = "left"
var right: String = "right"
var up: String = "up"
var down: String = "down"
var player_death: String = "player_death"

func _ready():
	collision_mask = Global.player_skvoz_steni

func _physics_process(delta):
	if Global.vkluchit_Zvuk_B == true:
		$AudioStreamPlayer2.play()
		Global.Vkluchit_Zvuk_B = false
	
	var direction: Vector2 = Vector2.ZERO
	if Global.player_voshel_v_vorota == false and Global.player_death == false:
		if Input.is_key_pressed(KEY_KP_1) and anim.animation != player_death:
			direction.x -= 1
			anim.play(left)
			# Включаю звуки шагов, то же самое на других направлениях
			if ShagiGorizontal == false:
				$ShagiVertical.stop()
				$ShagiGorizontal.play()
				ShagiGorizontal = true
		elif Input.is_key_pressed(KEY_KP_3) and anim.animation != player_death:
			direction.x += 1
			anim.play(right)
			if ShagiGorizontal == false:
				$ShagiVertical.stop()
				$ShagiGorizontal.play()
				ShagiGorizontal = true
		elif Input.is_key_pressed(KEY_KP_5) and anim.animation != player_death:
			direction.y -= 1
			anim.play(up)
			if ShagiVertical == false:
				$ShagiGorizontal.stop()
				$ShagiVertical.play()
				ShagiVertical = true
		elif Input.is_key_pressed(KEY_KP_2) and anim.animation != player_death:
			direction.y += 1
			anim.play(down)
			if ShagiVertical == false:
				$ShagiGorizontal.stop()
				$ShagiVertical.play()
				ShagiVertical = true
		else:
			$ShagiGorizontal.stop()
			$ShagiVertical.stop()
			ShagiGorizontal = false
			ShagiVertical = false
			if anim.animation != player_death:
				anim.stop()

		if direction.length_squared() > 0:
			velocity = direction.normalized() * Global.speed
		else:
			velocity = Vector2.ZERO
			
		if (Global.sozdannih_b_player_2 < Global.maximum_b_player_2) and Input.is_action_pressed("ui_key_A_player_2") and Global.player_death != true:
			bomb_player_2_create()
			
		move_and_slide()
	else:
		if anim.animation != "player_death":
			anim.stop()
		$ShagiGorizontal.stop()
		$ShagiVertical.stop()
		ShagiGorizontal = false
		ShagiVertical = false
	
func destroy():
	if not has_been_destroyed: # Если функция не вызывалась
		Global.player_death = true
		has_been_destroyed = true 
		anim.play(player_death)
		$Sound_player_death.play()
		anim.animation_finished.connect(_on_animated_sprite_2d_animation_finished)
	
func _on_animated_sprite_2d_animation_finished():
	$"../AudioStreamPlayer2D".stop()
	$"../AudioStreamPlayer2D2".stop()
	$Sound_player_death2.play()
	
func _on_sound_player_death_2_finished():
	has_been_destroyed = false 
	Global.chislo_gizney -= 1
	Global.player_death = false
	Global.vkluchit_Zvuk_B = false
	Global.massiv_vse_sozdannie_mobi.clear()
	Global.coordinates_with_block_kirpich.clear()
	Global.svobodnie_coordinates.clear()
	Global.sozdannih_b = 0 
	Global.sozdannih_b_player_2 = 0
	Global.coordinate_kuda_ustanovlenna_poslednaa_b = null 
	Global.coordinate_kuda_ustanovlenna_poslednaa_b_player_2 = null
	Global.massiv_kuda_ustanovlenna_poslednaa_b = []
	Global.massiv_kuda_ustanovlenna_poslednaa_b_player_2 = []
	Global.massiav_s_b.clear()
	Global.massiav_s_b_player_2.clear()
	Global.massiv_nevidimiy_block.clear()
	Global.massiv_nevidimiy_block_player_2.clear()
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
		
	queue_free()
	
	if Global.chislo_gizney > 0:
		get_tree().change_scene_to_file("res://Menu_nomer_stage/menu_nomer_stage.tscn")
	else:
		get_tree().change_scene_to_file("res://Menu_game_over/menu_game_over.tscn")
		Global.chislo_gizney = 6
		Global.more_enemy = 1
		Global.nagalKnopkuB = false
		Global.dlina_lazera = 48
		Global.dlina_lazera_nomer = 1
		Global.Speed = 170
		Global.maximum_b = 1
		Global.maximum_b_player_2 = 1
		Global.mob_pulki = false
		Global.novie_mobi = false
		Global.Vkluchit_Zvuk_B = false
		Global.vtoroy_player = false
		Global.player_skvoz_steni = 76
		
func bomb_player_2_create():
	
	var nearest_point: Vector2 = Global.points[0] 
	var min_distance: float = global_position.distance_to(nearest_point)
	for point in Global.points:
		var distance = global_position.distance_to(point)
		if distance < min_distance:
			min_distance = distance
			nearest_point = point
	if Global.coordinate_kuda_ustanovlenna_poslednaa_b_player_2 != nearest_point and not is_point_in_kirpich_array(nearest_point) and not (nearest_point in Global.massiv_kuda_ustanovlenna_poslednaa_b):
		var bomb_player_2_new = bomb_player_2.instantiate()
		add_child(bomb_player_2_new)
		bomb_player_2_new.global_position = nearest_point
		Global.massiav_s_b_player_2.append(bomb_player_2_new) 
		Global.coordinate_kuda_ustanovlenna_poslednaa_b_player_2 = nearest_point
		Global.massiv_kuda_ustanovlenna_poslednaa_b_player_2.append(Global.coordinate_kuda_ustanovlenna_poslednaa_b_player_2)
		Global.sozdannih_b_player_2 += 1
		
		var nevidimiy_block_player_2_new = nevidimiy_block_player_2.instantiate()
		add_child(nevidimiy_block_player_2_new)
		nevidimiy_block_player_2_new.global_position = nearest_point
		Global.massiv_nevidimiy_block_player_2.append(nevidimiy_block_player_2_new) 
		$Sound_create_b.play()
	
# Проверка, чтобы было нельзя установить bomb_player_2 в место где находится кирпичный блок
func is_point_in_kirpich_array(point):
	for coord in Global.coordinates_with_block_kirpich:
		if coord == point:
			return true
	return false
