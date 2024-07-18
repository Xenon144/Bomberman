extends StaticBody2D

var lazer_up = preload("res://Lazer/Lazer_up/lazer_up.tscn")
var lazer_down = preload("res://Lazer/Lazer_down/lazer_down.tscn")
var lazer_left = preload("res://Lazer/Lazer_left/lazer_left.tscn")
var lazer_right = preload("res://Lazer/Lazer_right/lazer_right.tscn")

var lazer_gorizontal = preload("res://Lazer/Lazer_gorizontal/lazer_gorizontal.tscn")
var lazer_vertical = preload("res://Lazer/Lazer_vertical/lazer_vertical.tscn")
var lazer_konec_right = preload("res://Lazer/Lazer_konec_right/lazer_konec_right.tscn")
var lazer_konec_left = preload("res://Lazer/Lazer_konec_left/lazer_konec_left.tscn")
var lazer_konec_up = preload("res://Lazer/Lazer_konec_up/lazer_konec_up.tscn")
var lazer_konec_down = preload("res://Lazer/Lazer_konec_down/lazer_konec_down.tscn")
var lazer_center = preload("res://Lazer/Lazer_center/lazer_center.tscn")

# Когда оба игрока выдут из бомбы, то не смогут больше в неё входить
var player_1_vishel_iz_b: bool = true
var player_2_vishel_iz_b: bool = true
func _on_area_2d_body_exited(body):
	if body.name == "player": 
		player_1_vishel_iz_b = true
	if body.name == "player_2": 
		player_2_vishel_iz_b = true
	if player_1_vishel_iz_b == true and player_2_vishel_iz_b == true:
		$CollisionShape2D.set_deferred("disabled", false)
		
func _on_area_2d_body_entered(body):
	if body.name == "player": 
		player_1_vishel_iz_b = false
	if body.name == "player_2": 
		player_2_vishel_iz_b = false
######################################################################

func _ready():
	if Global.vzal_item_knopka == false:
		$Timer.start()

func _on_timer_timeout():
	if Global.vzal_item_knopka == false:
		destroy()

func _process(delta):
	if Global.vzal_item_knopka == true and Global.player_voshel_v_vorota == false:
		if Input.is_action_pressed("ui_key_B_player_1"):
			Global.nagalKnopkuB = true
			if Global.nagalKnopkuB == true:
				Global.massiav_s_b[0].destroy()
				Global.massiav_s_b.pop_front()
				Global.nagalKnopkuB = false
		
			
func destroy():
	var new_lazer_up = lazer_up.instantiate()
	get_parent().add_child(new_lazer_up)
	new_lazer_up.global_position = global_position
		
	var new_lazer_down = lazer_down.instantiate()
	get_parent().add_child(new_lazer_down)
	new_lazer_down.global_position = global_position
	
	var new_lazer_left = lazer_left.instantiate()
	get_parent().add_child(new_lazer_left)
	new_lazer_left.global_position = global_position
	
	var new_lazer_right = lazer_right.instantiate()
	get_parent().add_child(new_lazer_right)
	new_lazer_right.global_position = global_position
	
	# Лазер вправо ##########################################################
	# В глобальный массив помещаются координаты в которые может 
	# распространиться лазер вправо, центральная координата не добавляется
	Global.right_coordinate_dla_lazera.clear()
	Global.right_coordinate_dla_lazera_zanatie_blokami.clear()
	Global.right_coordinate_dla_lazera_s_uchetom_blokov.clear()
	for i in range(1, Global.dlina_lazera_nomer + 1):
		var new_coordinate = Global.massiv_kuda_ustanovlenna_poslednaa_b[0]
		new_coordinate.x += 48 * i
		Global.right_coordinate_dla_lazera.append(new_coordinate)
		# Помещаю в переменную, последнюю коррдинату из массива. Если 
		# эта координата будет крайней, то в ней будет анимация конца луча лазера
		Global.right_kraynaa_sprava_coordinate_dla_lazera = Global.right_coordinate_dla_lazera[-1]
		
	# В глобальный массив помещаю координаты для лазера, которые заняты блоками
	for coord in Global.right_coordinate_dla_lazera:
		# Проверяем, присутствует ли этот элемент во втором и третьем массивах
		if coord in Global.coordinates_with_block_kirpich or coord in Global.kamenniy_block_s_blokami_ot_mobov:
			# Если элемент присутствует во всех массивах, добавляем его в результирующий массив
			Global.right_coordinate_dla_lazera_zanatie_blokami.append(coord)
			
	# В массив будут добавлены координаты левее блоков
	for coordinate in Global.right_coordinate_dla_lazera:
		# Флаг, указывающий, что текущий элемент подходит по условию
		var suitable = true
		# Проверяем координату x текущего элемента
		for block_coordinate in Global.right_coordinate_dla_lazera_zanatie_blokami:
			if coordinate.x >= block_coordinate.x:
				suitable = false
				break
	# Если текущий элемент удовлетворяет условию, добавляем его в массив
		if suitable:
			Global.right_coordinate_dla_lazera_s_uchetom_blokov.append(coordinate)	

	# Спаун лазера не будет в крайней свободной правой координате
	for coordinate in Global.right_coordinate_dla_lazera_s_uchetom_blokov:
		if coordinate != Global.right_kraynaa_sprava_coordinate_dla_lazera:
			var new_lazer_right2 = lazer_gorizontal.instantiate()
			get_parent().add_child(new_lazer_right2)
			new_lazer_right2.global_position = coordinate
	
	# Спаун наконечника лазера, если он должен быть
	if Global.right_coordinate_dla_lazera_s_uchetom_blokov.has(Global.right_kraynaa_sprava_coordinate_dla_lazera):
		var new_lazer_konec_right = lazer_konec_right.instantiate()
		get_parent().add_child(new_lazer_konec_right)
		new_lazer_konec_right.global_position = Global.right_kraynaa_sprava_coordinate_dla_lazera
	
	# Лазер влево ##########################################################
	# В глобальный массив помещаются координаты в которые может 
	# распространиться лазер влево, центральная координата не добавляется
	Global.left_coordinate_dla_lazera.clear()
	Global.left_coordinate_dla_lazera_zanatie_blokami.clear()
	Global.left_coordinate_dla_lazera_s_uchetom_blokov.clear()
	for i in range(1, Global.dlina_lazera_nomer + 1):
		var new_coordinate = Global.massiv_kuda_ustanovlenna_poslednaa_b[0]
		new_coordinate.x -= 48 * i
		Global.left_coordinate_dla_lazera.append(new_coordinate)
		# Помещаю в переменную, последнюю коррдинату из массива. Если 
		# эта координата будет крайней, то в ней будет анимация конца луча лазера
		Global.left_kraynaa_left_coordinate_dla_lazera = Global.left_coordinate_dla_lazera[-1]
		
	# В глобальный массив помещаю координаты для лазера, которые заняты блоками
	for coord in Global.left_coordinate_dla_lazera:
		# Проверяем, присутствует ли этот элемент во втором и третьем массивах
		if coord in Global.coordinates_with_block_kirpich or coord in Global.kamenniy_block_s_blokami_ot_mobov:
			# Если элемент присутствует во всех массивах, добавляем его в результирующий массив
			Global.left_coordinate_dla_lazera_zanatie_blokami.append(coord)
			
	# В массив будут добавлены координаты левее блоков
	for coordinate in Global.left_coordinate_dla_lazera:
		# Флаг, указывающий, что текущий элемент подходит по условию
		var suitable = true
		# Проверяем координату x текущего элемента
		for block_coordinate in Global.left_coordinate_dla_lazera_zanatie_blokami:
			if coordinate.x <= block_coordinate.x:
				suitable = false
				break
	# Если текущий элемент удовлетворяет условию, добавляем его в массив
		if suitable:
			Global.left_coordinate_dla_lazera_s_uchetom_blokov.append(coordinate)	

	# Спаун лазера не будет в крайней свободной левой координате
	for coordinate in Global.left_coordinate_dla_lazera_s_uchetom_blokov:
		if coordinate != Global.left_kraynaa_left_coordinate_dla_lazera:
			var new_lazer_left2 = lazer_gorizontal.instantiate()
			get_parent().add_child(new_lazer_left2)
			new_lazer_left2.global_position = coordinate
	
	# Спаун наконечника лазера, если он должен быть
	if Global.left_coordinate_dla_lazera_s_uchetom_blokov.has(Global.left_kraynaa_left_coordinate_dla_lazera):
		var new_lazer_konec_left = lazer_konec_left.instantiate()
		get_parent().add_child(new_lazer_konec_left)
		new_lazer_konec_left.global_position = Global.left_kraynaa_left_coordinate_dla_lazera
	
	# Лазер вверх ##########################################################
	# В глобальный массив помещаются координаты в которые может 
	# распространиться лазер вверх, центральная координата не добавляется
	Global.up_coordinate_dla_lazera.clear()
	Global.up_coordinate_dla_lazera_zanatie_blokami.clear()
	Global.up_coordinate_dla_lazera_s_uchetom_blokov.clear()
	for i in range(1, Global.dlina_lazera_nomer + 1):
		var new_coordinate = Global.massiv_kuda_ustanovlenna_poslednaa_b[0]
		new_coordinate.y -= 48 * i
		Global.up_coordinate_dla_lazera.append(new_coordinate)
		# Помещаю в переменную, последнюю коррдинату из массива. Если 
		# эта координата будет крайней, то в ней будет анимация конца луча лазера
		Global.up_kraynaa_up_coordinate_dla_lazera = Global.up_coordinate_dla_lazera[-1]
		
	# В глобальный массив помещаю координаты для лазера, которые заняты блоками
	for coord in Global.up_coordinate_dla_lazera:
		# Проверяем, присутствует ли этот элемент во втором и третьем массивах
		if coord in Global.coordinates_with_block_kirpich or coord in Global.kamenniy_block_s_blokami_ot_mobov:
			# Если элемент присутствует во всех массивах, добавляем его в результирующий массив
			Global.up_coordinate_dla_lazera_zanatie_blokami.append(coord)
			
	# В массив будут добавлены координаты выше блоков
	for coordinate in Global.up_coordinate_dla_lazera:
		# Флаг, указывающий, что текущий элемент подходит по условию
		var suitable = true
		# Проверяем координату x текущего элемента
		for block_coordinate in Global.up_coordinate_dla_lazera_zanatie_blokami:
			if coordinate.y <= block_coordinate.y:
				suitable = false
				break
	# Если текущий элемент удовлетворяет условию, добавляем его в массив
		if suitable:
			Global.up_coordinate_dla_lazera_s_uchetom_blokov.append(coordinate)	

	# Спаун лазера не будет в крайней свободной верхней координате
	for coordinate in Global.up_coordinate_dla_lazera_s_uchetom_blokov:
		if coordinate != Global.up_kraynaa_up_coordinate_dla_lazera:
			var new_lazer_up2 = lazer_vertical.instantiate()
			get_parent().add_child(new_lazer_up2)
			new_lazer_up2.global_position = coordinate
	
	# Спаун наконечника лазера, если он должен быть
	if Global.up_coordinate_dla_lazera_s_uchetom_blokov.has(Global.up_kraynaa_up_coordinate_dla_lazera):
		var new_lazer_konec_up = lazer_konec_up.instantiate()
		get_parent().add_child(new_lazer_konec_up)
		new_lazer_konec_up.global_position = Global.up_kraynaa_up_coordinate_dla_lazera
	
	# Спаун центра лазера
	var new_lazer_center = lazer_center.instantiate()
	get_parent().add_child(new_lazer_center)
	new_lazer_center.global_position = Global.massiv_kuda_ustanovlenna_poslednaa_b[0]
	
	# Лазер вниз ##########################################################
	# В глобальный массив помещаются координаты в которые может 
	# распространиться лазер вниз, центральная координата не добавляется
	Global.down_coordinate_dla_lazera.clear()
	Global.down_coordinate_dla_lazera_zanatie_blokami.clear()
	Global.down_coordinate_dla_lazera_s_uchetom_blokov.clear()
	for i in range(1, Global.dlina_lazera_nomer + 1):
		var new_coordinate = Global.massiv_kuda_ustanovlenna_poslednaa_b[0]
		new_coordinate.y += 48 * i
		Global.down_coordinate_dla_lazera.append(new_coordinate)
		# Помещаю в переменную, последнюю коррдинату из массива. Если 
		# эта координата будет крайней, то в ней будет анимация конца луча лазера
		Global.down_kraynaa_down_coordinate_dla_lazera = Global.down_coordinate_dla_lazera[-1]
		
	# В глобальный массив помещаю координаты для лазера, которые заняты блоками
	for coord in Global.down_coordinate_dla_lazera:
		# Проверяем, присутствует ли этот элемент во втором и третьем массивах
		if coord in Global.coordinates_with_block_kirpich or coord in Global.kamenniy_block_s_blokami_ot_mobov:
			# Если элемент присутствует во всех массивах, добавляем его в результирующий массив
			Global.down_coordinate_dla_lazera_zanatie_blokami.append(coord)
			
	# В массив будут добавлены координаты выше блоков
	for coordinate in Global.down_coordinate_dla_lazera:
		# Флаг, указывающий, что текущий элемент подходит по условию
		var suitable = true
		# Проверяем координату x текущего элемента
		for block_coordinate in Global.down_coordinate_dla_lazera_zanatie_blokami:
			if coordinate.y >= block_coordinate.y:
				suitable = false
				break
	# Если текущий элемент удовлетворяет условию, добавляем его в массив
		if suitable:
			Global.down_coordinate_dla_lazera_s_uchetom_blokov.append(coordinate)	

	# Спаун лазера не будет в крайней свободной нижней координате
	for coordinate in Global.down_coordinate_dla_lazera_s_uchetom_blokov:
		if coordinate != Global.down_kraynaa_down_coordinate_dla_lazera:
			var new_lazer_down2 = lazer_vertical.instantiate()
			get_parent().add_child(new_lazer_down2)
			new_lazer_down2.global_position = coordinate
	
	# Спаун наконечника лазера, если он должен быть
	if Global.down_coordinate_dla_lazera_s_uchetom_blokov.has(Global.down_kraynaa_down_coordinate_dla_lazera):
		var new_lazer_konec_down = lazer_konec_down.instantiate()
		get_parent().add_child(new_lazer_konec_down)
		new_lazer_konec_down.global_position = Global.down_kraynaa_down_coordinate_dla_lazera
		# #######################################################################
	
	
	Global.sozdannih_b -= 1
	queue_free()
	Global.vkluchit_Zvuk_B = true
	#if Global.massiav_s_b.size() > 0:
	#	Global.massiav_s_b.pop_front()
	Global.coordinate_kuda_ustanovlenna_poslednaa_b = null
	# Из массива удаляются b в порядке их появления
	if Global.massiv_kuda_ustanovlenna_poslednaa_b.size() > 0:
		Global.massiv_kuda_ustanovlenna_poslednaa_b.pop_front()
	
