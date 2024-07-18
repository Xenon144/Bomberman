extends Node2D

const blok_kirpich_preload = preload("res://Block_Kirpich/block_kirpich.tscn")
const mob_shar_preload = preload("res://Mobs/Mob_shar/mob_shar.tscn")
const mob_monetka_preload = preload("res://Mobs/Mob_monetka/mob_monetka.tscn")
const mob_bochka_preload = preload("res://Mobs/Mob_bochka/mob_bochka.tscn")
const mob_luk_preload = preload("res://Mobs/Mob_luk/mob_luk.tscn")
const mob_kolobok_preload = preload("res://Mobs/Mob_kolobok/mob_kolobok.tscn")
const mob_roja_preload = preload("res://Mobs/Mob_roja/mob_roja.tscn")
const mob_meduza_preload = preload("res://Mobs/Mob_meduza/mob_meduza.tscn")
const mob_prividenie_preload = preload("res://Mobs/Mob_prividenie/mob_prividenie.tscn")
const mob_block_preload = preload("res://Mobs/Mob_block/mob_block.tscn")
const mob_b_preload = preload("res://Mobs/Mob_b/mob_b.tscn")

var svobodnie_koordinati_rjadom_s_igrokom: Array[Vector2] = [Vector2(72,168),
Vector2(120,168),
Vector2(168,168),
Vector2(216,168),
Vector2(72,216),
Vector2(168,216),
Vector2(72,264),
Vector2(120,264),
Vector2(168,264),
Vector2(216,264),
Vector2(72,312),
Vector2(168,312)]
 
func _ready():
	# Включение и выключение второго игрока
	if Global.vtoroy_player == false:
		$player_2.queue_free()
	
	$Timer.start()
	# Добавление в массив Global.coordinates_with_block_kirpich 50 случайных элементов из массива Global.all_coordinates
	var unique_indices = []
	while Global.coordinates_with_block_kirpich.size() < 50 and unique_indices.size() < Global.all_coordinates.size():# Цифра - это сколько блоков будет на сцене
		var random_index = randi() % Global.all_coordinates.size()
		if !unique_indices.has(random_index):
			Global.coordinates_with_block_kirpich.append(Global.all_coordinates[random_index])
			unique_indices.append(random_index)
	# В массив Global.svobodnie_coordinates добавляются координаты в которых нет блоков с кирпичами
	for coordinate in Global.all_coordinates:
		if !Global.coordinates_with_block_kirpich.has(coordinate):
			Global.svobodnie_coordinates.append(coordinate)
	# Удаляю из массива svobodnie_coordinates координаты рядом с игроком, чтобы мобы не появлялись в начале игры около игрока
	var novij_global_coordinates = []
	for coord in Global.svobodnie_coordinates:
		var contains = false
		for coord_rjadom in svobodnie_koordinati_rjadom_s_igrokom:
			if coord == coord_rjadom:
				contains = true
				break
		if not contains:
			novij_global_coordinates.append(coord)
	Global.svobodnie_coordinates = novij_global_coordinates
		
	blok_kirpich_spawn()
		
	# Выбираю 1 случайную координату для item
	var random_index_for_item = randi_range(0, Global.coordinates_with_block_kirpich.size() - 1)
	Global.coordinate_item = Global.coordinates_with_block_kirpich[random_index_for_item]
	
	# Выбираю 1 случайную координату для vorota 
	var random_index_for_vorota = randi_range(0, Global.coordinates_with_block_kirpich.size() - 1)
	Global.coordinate_vorota = Global.coordinates_with_block_kirpich[random_index_for_vorota]
	# Цикл нужен, чтобы координаты итема не совпали с воротами
	while Global.coordinate_vorota == Global.coordinate_item:
		random_index_for_vorota = randi_range(0, Global.coordinates_with_block_kirpich.size() - 1)
		Global.coordinate_vorota = Global.coordinates_with_block_kirpich[random_index_for_vorota]
	
	# Создаю итем
	var item
	if Global.stage_nomer == 1:
		item = $item_lazer
	elif Global.stage_nomer == 2:
		item = $item_lazer
	elif Global.stage_nomer == 3:
		item = $item_speed
	elif Global.stage_nomer == 4:
		item = $item_b
	elif Global.stage_nomer == 5:
		item = $item_lazer
	elif Global.stage_nomer == 6:
		item = $item_skvoz_steni
	elif Global.stage_nomer == 7:
		item = $item_knopka
	elif Global.stage_nomer == 8:
		item = $item_b
	elif Global.stage_nomer == 9:
		item = $item_flamepass
	elif Global.stage_nomer == 10:
		item = $item_lazer
	else:
		item = $item_lazer
	item.position = Global.coordinate_item  
	
	# Создание ворот 
	var vorota = $vorota
	vorota.position = Global.coordinate_vorota 
	
	# Создание мобов в начале игры. В зависимости от стадии
	if Global.stage_nomer == 1:
		mob_shar_spawn()
		if Global.novie_mobi == true:
			mob_block_spawn()
			mob_bomb_spawn()
	elif Global.stage_nomer == 2:
		mob_shar_spawn()
		mob_luk_spawn()
		if Global.novie_mobi == true:
			mob_block_spawn()
			mob_bomb_spawn()
	elif Global.stage_nomer == 3:
		mob_shar_spawn()
		mob_luk_spawn()
		mob_bochka_spawn()
		if Global.novie_mobi == true:
			mob_block_spawn()
			mob_bomb_spawn()
	elif Global.stage_nomer == 4:
		mob_shar_spawn()
		mob_luk_spawn()
		mob_bochka_spawn()
		mob_kolobok_spawn()
		if Global.novie_mobi == true:
			mob_block_spawn()
			mob_bomb_spawn()
	elif Global.stage_nomer == 5:
		mob_shar_spawn()
		mob_luk_spawn()
		mob_bochka_spawn()
		mob_kolobok_spawn()
		mob_roja_spawn()
		if Global.novie_mobi == true:
			mob_block_spawn()
			mob_bomb_spawn()
	elif Global.stage_nomer == 6:
		mob_shar_spawn()
		mob_luk_spawn()
		mob_bochka_spawn()
		mob_kolobok_spawn()
		mob_roja_spawn()
		mob_meduza_spawn()
		if Global.novie_mobi == true:
			mob_block_spawn()
			mob_bomb_spawn()
	elif Global.stage_nomer == 7:
		mob_shar_spawn()
		mob_luk_spawn()
		mob_bochka_spawn()
		mob_kolobok_spawn()
		mob_roja_spawn()
		mob_meduza_spawn()
		mob_prividenie_spawn()
		if Global.novie_mobi == true:
			mob_block_spawn()
			mob_bomb_spawn()
	elif Global.stage_nomer == 8:
		mob_shar_spawn()
		mob_luk_spawn()
		mob_bochka_spawn()
		mob_kolobok_spawn()
		mob_roja_spawn()
		mob_meduza_spawn()
		mob_prividenie_spawn()
		mob_monetka_spawn()
		if Global.novie_mobi == true:
			mob_block_spawn()
			mob_bomb_spawn()
	elif Global.stage_nomer == 9:
		mob_shar_spawn()
		mob_luk_spawn()
		mob_bochka_spawn()
		mob_kolobok_spawn()
		mob_roja_spawn()
		mob_meduza_spawn()
		mob_prividenie_spawn()
		mob_monetka_spawn()
		mob_monetka_spawn()
		if Global.novie_mobi == true:
			mob_block_spawn()
			mob_bomb_spawn()
	elif Global.stage_nomer >= 10 and Global.stage_nomer <= 15:
		mob_shar_spawn()
		mob_luk_spawn()
		mob_bochka_spawn()
		mob_kolobok_spawn()
		mob_roja_spawn()
		mob_meduza_spawn()
		mob_prividenie_spawn()
		mob_monetka_spawn()
		mob_monetka_spawn()
		mob_monetka_spawn()
		if Global.novie_mobi == true:
			mob_block_spawn()
			mob_bomb_spawn()
	
# Создание кирпичных блоков на сцене, равное количеству элементов в массиве Global.coordinates_with_block_kirpich
func blok_kirpich_spawn():
	for i in range(Global.coordinates_with_block_kirpich.size()):
		var blok_kirpich_new = blok_kirpich_preload.instantiate()
		blok_kirpich_new.position = Global.coordinates_with_block_kirpich[i]
		$bloki_kirpichi.add_child(blok_kirpich_new)
		
# Создание мобов-шаров на свободных от кирпичных блоках координатах
func mob_shar_spawn():
	for i in range(6 * Global.more_enemy):
		var mob_shar_new = mob_shar_preload.instantiate()
		var random_index = randi_range(0, Global.svobodnie_coordinates.size() - 1)
		mob_shar_new.position = Global.svobodnie_coordinates[random_index]
		$Mobs.add_child(mob_shar_new)
		Global.massiv_vse_sozdannie_mobi.append(mob_shar_new) 
		
func mob_monetka_spawn():
	for i in range(6 * Global.more_enemy):
		var mob_monetka_new = mob_monetka_preload.instantiate()
		var random_index = randi_range(0, Global.svobodnie_coordinates.size() - 1)
		mob_monetka_new.position = Global.svobodnie_coordinates[random_index]
		$Mobs.add_child(mob_monetka_new)
		Global.massiv_vse_sozdannie_mobi.append(mob_monetka_new)

func mob_bochka_spawn():
	for i in range(6 * Global.more_enemy):
		var mob_bochka_new = mob_bochka_preload.instantiate()
		var random_index = randi_range(0, Global.svobodnie_coordinates.size() - 1)
		mob_bochka_new.position = Global.svobodnie_coordinates[random_index]
		$Mobs.add_child(mob_bochka_new)
		Global.massiv_vse_sozdannie_mobi.append(mob_bochka_new)

func mob_luk_spawn():
	for i in range(6 * Global.more_enemy):
		var mob_luk_new = mob_luk_preload.instantiate()
		var random_index = randi_range(0, Global.svobodnie_coordinates.size() - 1)
		mob_luk_new.position = Global.svobodnie_coordinates[random_index]
		$Mobs.add_child(mob_luk_new)
		Global.massiv_vse_sozdannie_mobi.append(mob_luk_new)

func mob_kolobok_spawn():
	for i in range(6 * Global.more_enemy):
		var mob_kolobok_new = mob_kolobok_preload.instantiate()
		var random_index = randi_range(0, Global.svobodnie_coordinates.size() - 1)
		mob_kolobok_new.position = Global.svobodnie_coordinates[random_index]
		$Mobs.add_child(mob_kolobok_new)
		Global.massiv_vse_sozdannie_mobi.append(mob_kolobok_new)

func mob_roja_spawn():
	for i in range(6 * Global.more_enemy):
		var mob_roja_new = mob_roja_preload.instantiate()
		var random_index = randi_range(0, Global.svobodnie_coordinates.size() - 1)
		mob_roja_new.position = Global.svobodnie_coordinates[random_index]
		$Mobs.add_child(mob_roja_new)
		Global.massiv_vse_sozdannie_mobi.append(mob_roja_new)

func mob_meduza_spawn():
	for i in range(6 * Global.more_enemy):
		var mob_meduza_new = mob_meduza_preload.instantiate()
		var random_index = randi_range(0, Global.svobodnie_coordinates.size() - 1)
		mob_meduza_new.position = Global.svobodnie_coordinates[random_index]
		$Mobs.add_child(mob_meduza_new)
		Global.massiv_vse_sozdannie_mobi.append(mob_meduza_new)

func mob_prividenie_spawn():
	for i in range(6 * Global.more_enemy):
		var mob_prividenie_new = mob_prividenie_preload.instantiate()
		var random_index = randi_range(0, Global.svobodnie_coordinates.size() - 1)
		mob_prividenie_new.position = Global.svobodnie_coordinates[random_index]
		$Mobs.add_child(mob_prividenie_new)
		Global.massiv_vse_sozdannie_mobi.append(mob_prividenie_new)
		
func mob_block_spawn():
	for i in range(3 * Global.more_enemy):
		var mob_block_new = mob_block_preload.instantiate()
		var random_index = randi_range(0, Global.svobodnie_coordinates.size() - 1)
		mob_block_new.position = Global.svobodnie_coordinates[random_index]
		$Mobs.add_child(mob_block_new)
		Global.massiv_vse_sozdannie_mobi.append(mob_block_new)
		
func mob_bomb_spawn():
	for i in range(4 * Global.more_enemy):
		var mob_b_new = mob_b_preload.instantiate()
		var random_index = randi_range(0, Global.svobodnie_coordinates.size() - 1)
		mob_b_new.position = Global.svobodnie_coordinates[random_index]
		$Mobs.add_child(mob_b_new)
		Global.massiv_vse_sozdannie_mobi.append(mob_b_new)

# Когда в игре истечет время 200 секунд, появятся монетки
func _on_timer_timeout():
	mob_monetka_spawn()
	mob_monetka_spawn()

func _on_button_menu_pressed():
	get_tree().paused = true
	$CanvasLayer/PauseMenu.visible = true

func _on_resume_pressed():
	get_tree().paused = false
	$CanvasLayer/PauseMenu.visible = false

func _on_quit_pressed():
	get_tree().quit()
