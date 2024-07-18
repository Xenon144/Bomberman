extends CharacterBody2D

var pulka = preload("res://Pulka/pulka.tscn")
var lazer_up = preload("res://Lazer_MOB/MOB_Lazer_up/mob_lazer_up.tscn")
var lazer_down = preload("res://Lazer_MOB/MOB_Lazer_down/mob_lazer_down.tscn")
var lazer_left = preload("res://Lazer_MOB/MOB_Lazer_left/mob_lazer_left.tscn")
var lazer_right = preload("res://Lazer_MOB/MOB_Lazer_right/mob_lazer_right.tscn")
var lazer_gorizontal = preload("res://Lazer_MOB/MOB_Lazer_gorizontal/mob_lazer_gorizontal.tscn")
var lazer_vertical = preload("res://Lazer_MOB/MOB_Lazer_vertical/mob_lazer_vertical.tscn")
var lazer_konec_right = preload("res://Lazer_MOB/MOB_Lazer_konec_right/mob_lazer_konec_right.tscn")
var lazer_konec_left = preload("res://Lazer_MOB/MOB_Lazer_konec_left/mob_lazer_konec_left.tscn")
var lazer_konec_up = preload("res://Lazer_MOB/MOB_Lazer_konec_up/mob_lazer_konec_up.tscn")
var lazer_konec_down = preload("res://Lazer_MOB/MOB_Lazer_konec_down/mob_lazer_konec_down.tscn")
var lazer_center = preload("res://Lazer_MOB/MOB_Lazer_center/mob_lazer_center.tscn")

var massiav_s_b_MOB = []
var coordinate_kuda_ustanovlenna_poslednaa_b_MOB = null
var massiv_kuda_ustanovlenna_poslednaa_b_MOB = []

const speed = 100
var napravlenie_dvigenia = Vector2.ZERO
var mob_destroy: bool = false # Чтобы игрок не погибал, когда касается анимации уничтожающегося моба

@onready var anim = $AnimatedSprite2D
var anim_default = "anim_default"

func _ready():
	# Выбираем случайное направление при создании объекта
	var random_number = RandomNumberGenerator.new()
	random_number.randomize() # Инициализируем генератор случайных чисел
	var selected_number = random_number.randi_range(1, 4) 
	
	if selected_number == 1:
		napravlenie_dvigenia = Vector2.UP
	elif selected_number == 2:
		napravlenie_dvigenia = Vector2.DOWN
	elif selected_number == 3:
		napravlenie_dvigenia = Vector2.LEFT
	elif selected_number == 4:
		napravlenie_dvigenia = Vector2.RIGHT
		
	# Создание пулек, если они включены в глобальной переменной
	if Global.mob_pulki == true and mob_destroy == false:
		# Запускаем таймер на случайное время от 2 до 10 секунд
		var random_time = randf_range(2, 10)
		$Timer.wait_time = random_time
		$Timer.start()
		
	# Промежуток времени в который моб создаст b_moba 
	var random_time = randf_range(15, 35)
	$Timer2.wait_time = random_time
	$Timer2.start()

func _physics_process(delta):
	if Global.player_death == true:
		napravlenie_dvigenia = Vector2.ZERO
		anim.stop()
	var motion = napravlenie_dvigenia * speed * delta
	var collision = move_and_collide(motion)
	smena_dvigenija_napravlenija() # Функция для случайного изменения направления
		
	# Смена направления при столкновении с каменным или кирпичным блоком
	if collision:
		# Если произошло столкновение, меняем направление
		var random_number = RandomNumberGenerator.new()
		random_number.randomize() # Инициализируем генератор случайных чисел
		var selected_number = random_number.randi_range(1, 4) 
		
		if selected_number == 1:
			napravlenie_dvigenia = Vector2.UP
		elif selected_number == 2:
			napravlenie_dvigenia = Vector2.DOWN
		elif selected_number == 3:
			napravlenie_dvigenia = Vector2.LEFT
		elif selected_number == 4:
			napravlenie_dvigenia = Vector2.RIGHT
			
# Функция для случайного изменения направления
func smena_dvigenija_napravlenija():
	for coord in Global.coordinates_menatj_napravlenie:
		if position.distance_to(coord) < 1: 
			var random_number = RandomNumberGenerator.new()
			random_number.randomize() 
			var selected_number = random_number.randi_range(1, 4) 
		
			if selected_number == 1:
				var random_number2 = RandomNumberGenerator.new()
				random_number.randomize() # Инициализируем генератор случайных чисел
				var selected_number2 = random_number.randi_range(1, 4) 
				
				if selected_number2 == 1:
					napravlenie_dvigenia = Vector2.UP
				elif selected_number2 == 2:
					napravlenie_dvigenia = Vector2.DOWN
				elif selected_number2 == 3:
					napravlenie_dvigenia = Vector2.LEFT
				elif selected_number2 == 4:
					napravlenie_dvigenia = Vector2.RIGHT
					
func destroy():
	napravlenie_dvigenia = Vector2.ZERO
	mob_destroy = true
	queue_free()
	Global.massiv_vse_sozdannie_mobi.erase(self) # Удаляю из глобального массива моба, который был уничтожен

# Когда таймер истекает, запускается пулька
func _on_timer_timeout():
	if Global.mob_pulki == true:
		var new_pulka = pulka.instantiate()
		get_parent().add_child(new_pulka)
		new_pulka.global_position = global_position
		
func _on_area_2d_body_entered(player):
	if player.has_method("destroy") and not player.has_been_destroyed and mob_destroy == false:
		player.destroy()
		
func _on_timer_2_timeout():
	var nearest_point: Vector2 = Global.points[0] 
	var min_distance: float = global_position.distance_to(nearest_point)
	for point in Global.points:
		var distance = global_position.distance_to(point)
		if distance < min_distance:
			min_distance = distance
			nearest_point = point
	coordinate_kuda_ustanovlenna_poslednaa_b_MOB = nearest_point
	
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
	Global.right_coordinate_dla_lazera_MOB.clear()
	Global.right_coordinate_dla_lazera_zanatie_blokami_MOB.clear()
	Global.right_coordinate_dla_lazera_s_uchetom_blokov_MOB.clear()
	for i in range(1, Global.dlina_lazera_nomer + 1):
		var new_coordinate = coordinate_kuda_ustanovlenna_poslednaa_b_MOB
		new_coordinate.x += 48 * i
		Global.right_coordinate_dla_lazera_MOB.append(new_coordinate)
		# Помещаю в переменную, последнюю коррдинату из массива. Если 
		# эта координата будет крайней, то в ней будет анимация конца луча лазера
		Global.right_kraynaa_sprava_coordinate_dla_lazera_MOB = Global.right_coordinate_dla_lazera_MOB[-1]
		
	# В глобальный массив помещаю координаты для лазера, которые заняты блоками
	for coord in Global.right_coordinate_dla_lazera_MOB:
		# Проверяем, присутствует ли этот элемент во втором и третьем массивах
		if coord in Global.coordinates_with_block_kirpich or coord in Global.kamenniy_block_s_blokami_ot_mobov:
			# Если элемент присутствует во всех массивах, добавляем его в результирующий массив
			Global.right_coordinate_dla_lazera_zanatie_blokami_MOB.append(coord)
			
	# В массив будут добавлены координаты левее блоков
	for coordinate in Global.right_coordinate_dla_lazera_MOB:
		# Флаг, указывающий, что текущий элемент подходит по условию
		var suitable = true
		# Проверяем координату x текущего элемента
		for block_coordinate in Global.right_coordinate_dla_lazera_zanatie_blokami_MOB:
			if coordinate.x >= block_coordinate.x:
				suitable = false
				break
	# Если текущий элемент удовлетворяет условию, добавляем его в массив
		if suitable:
			Global.right_coordinate_dla_lazera_s_uchetom_blokov_MOB.append(coordinate)	

	# Спаун лазера не будет в крайней свободной правой координате
	for coordinate in Global.right_coordinate_dla_lazera_s_uchetom_blokov_MOB:
		if coordinate != Global.right_kraynaa_sprava_coordinate_dla_lazera_MOB:
			var new_lazer_right2 = lazer_gorizontal.instantiate()
			get_parent().add_child(new_lazer_right2)
			new_lazer_right2.global_position = coordinate
	
	# Спаун наконечника лазера, если он должен быть
	if Global.right_coordinate_dla_lazera_s_uchetom_blokov_MOB.has(Global.right_kraynaa_sprava_coordinate_dla_lazera_MOB):
		var new_lazer_konec_right = lazer_konec_right.instantiate()
		get_parent().add_child(new_lazer_konec_right)
		new_lazer_konec_right.global_position = Global.right_kraynaa_sprava_coordinate_dla_lazera_MOB
	
	# Лазер влево ##########################################################
	# В глобальный массив помещаются координаты в которые может 
	# распространиться лазер влево, центральная координата не добавляется
	Global.left_coordinate_dla_lazera_MOB.clear()
	Global.left_coordinate_dla_lazera_zanatie_blokami_MOB.clear()
	Global.left_coordinate_dla_lazera_s_uchetom_blokov_MOB.clear()
	for i in range(1, Global.dlina_lazera_nomer + 1):
		var new_coordinate = coordinate_kuda_ustanovlenna_poslednaa_b_MOB
		new_coordinate.x -= 48 * i
		Global.left_coordinate_dla_lazera_MOB.append(new_coordinate)
		# Помещаю в переменную, последнюю коррдинату из массива. Если 
		# эта координата будет крайней, то в ней будет анимация конца луча лазера
		Global.left_kraynaa_left_coordinate_dla_lazera_MOB = Global.left_coordinate_dla_lazera_MOB[-1]
		
	# В глобальный массив помещаю координаты для лазера, которые заняты блоками
	for coord in Global.left_coordinate_dla_lazera_MOB:
		# Проверяем, присутствует ли этот элемент во втором и третьем массивах
		if coord in Global.coordinates_with_block_kirpich or coord in Global.kamenniy_block_s_blokami_ot_mobov:
			# Если элемент присутствует во всех массивах, добавляем его в результирующий массив
			Global.left_coordinate_dla_lazera_zanatie_blokami_MOB.append(coord)
			
	# В массив будут добавлены координаты левее блоков
	for coordinate in Global.left_coordinate_dla_lazera_MOB:
		# Флаг, указывающий, что текущий элемент подходит по условию
		var suitable = true
		# Проверяем координату x текущего элемента
		for block_coordinate in Global.left_coordinate_dla_lazera_zanatie_blokami_MOB:
			if coordinate.x <= block_coordinate.x:
				suitable = false
				break
	# Если текущий элемент удовлетворяет условию, добавляем его в массив
		if suitable:
			Global.left_coordinate_dla_lazera_s_uchetom_blokov_MOB.append(coordinate)	

	# Спаун лазера не будет в крайней свободной левой координате
	for coordinate in Global.left_coordinate_dla_lazera_s_uchetom_blokov_MOB:
		if coordinate != Global.left_kraynaa_left_coordinate_dla_lazera_MOB:
			var new_lazer_left2 = lazer_gorizontal.instantiate()
			get_parent().add_child(new_lazer_left2)
			new_lazer_left2.global_position = coordinate
	
	# Спаун наконечника лазера, если он должен быть
	if Global.left_coordinate_dla_lazera_s_uchetom_blokov_MOB.has(Global.left_kraynaa_left_coordinate_dla_lazera_MOB):
		var new_lazer_konec_left = lazer_konec_left.instantiate()
		get_parent().add_child(new_lazer_konec_left)
		new_lazer_konec_left.global_position = Global.left_kraynaa_left_coordinate_dla_lazera_MOB
	
	# Лазер вверх ##########################################################
	# В глобальный массив помещаются координаты в которые может 
	# распространиться лазер вверх, центральная координата не добавляется
	Global.up_coordinate_dla_lazera_MOB.clear()
	Global.up_coordinate_dla_lazera_zanatie_blokami_MOB.clear()
	Global.up_coordinate_dla_lazera_s_uchetom_blokov_MOB.clear()
	for i in range(1, Global.dlina_lazera_nomer + 1):
		var new_coordinate = coordinate_kuda_ustanovlenna_poslednaa_b_MOB
		new_coordinate.y -= 48 * i
		Global.up_coordinate_dla_lazera_MOB.append(new_coordinate)
		# Помещаю в переменную, последнюю коррдинату из массива. Если 
		# эта координата будет крайней, то в ней будет анимация конца луча лазера
		Global.up_kraynaa_up_coordinate_dla_lazera_MOB = Global.up_coordinate_dla_lazera_MOB[-1]
		
	# В глобальный массив помещаю координаты для лазера, которые заняты блоками
	for coord in Global.up_coordinate_dla_lazera_MOB:
		# Проверяем, присутствует ли этот элемент во втором и третьем массивах
		if coord in Global.coordinates_with_block_kirpich or coord in Global.kamenniy_block_s_blokami_ot_mobov:
			# Если элемент присутствует во всех массивах, добавляем его в результирующий массив
			Global.up_coordinate_dla_lazera_zanatie_blokami_MOB.append(coord)
			
	# В массив будут добавлены координаты выше блоков
	for coordinate in Global.up_coordinate_dla_lazera_MOB:
		# Флаг, указывающий, что текущий элемент подходит по условию
		var suitable = true
		# Проверяем координату x текущего элемента
		for block_coordinate in Global.up_coordinate_dla_lazera_zanatie_blokami_MOB:
			if coordinate.y <= block_coordinate.y:
				suitable = false
				break
	# Если текущий элемент удовлетворяет условию, добавляем его в массив
		if suitable:
			Global.up_coordinate_dla_lazera_s_uchetom_blokov_MOB.append(coordinate)	

	# Спаун лазера не будет в крайней свободной верхней координате
	for coordinate in Global.up_coordinate_dla_lazera_s_uchetom_blokov_MOB:
		if coordinate != Global.up_kraynaa_up_coordinate_dla_lazera_MOB:
			var new_lazer_up2 = lazer_vertical.instantiate()
			get_parent().add_child(new_lazer_up2)
			new_lazer_up2.global_position = coordinate
	
	# Спаун наконечника лазера, если он должен быть
	if Global.up_coordinate_dla_lazera_s_uchetom_blokov_MOB.has(Global.up_kraynaa_up_coordinate_dla_lazera_MOB):
		var new_lazer_konec_up = lazer_konec_up.instantiate()
		get_parent().add_child(new_lazer_konec_up)
		new_lazer_konec_up.global_position = Global.up_kraynaa_up_coordinate_dla_lazera_MOB
	
	# Спаун центра лазера
	var new_lazer_center = lazer_center.instantiate()
	get_parent().add_child(new_lazer_center)
	new_lazer_center.global_position = coordinate_kuda_ustanovlenna_poslednaa_b_MOB
	
	# Лазер вниз ##########################################################
	# В глобальный массив помещаются координаты в которые может 
	# распространиться лазер вниз, центральная координата не добавляется
	Global.down_coordinate_dla_lazera_MOB.clear()
	Global.down_coordinate_dla_lazera_zanatie_blokami_MOB.clear()
	Global.down_coordinate_dla_lazera_s_uchetom_blokov_MOB.clear()
	for i in range(1, Global.dlina_lazera_nomer + 1):
		var new_coordinate = coordinate_kuda_ustanovlenna_poslednaa_b_MOB
		new_coordinate.y += 48 * i
		Global.down_coordinate_dla_lazera_MOB.append(new_coordinate)
		# Помещаю в переменную, последнюю коррдинату из массива. Если 
		# эта координата будет крайней, то в ней будет анимация конца луча лазера
		Global.down_kraynaa_down_coordinate_dla_lazera_MOB = Global.down_coordinate_dla_lazera_MOB[-1]
		
	# В глобальный массив помещаю координаты для лазера, которые заняты блоками
	for coord in Global.down_coordinate_dla_lazera_MOB:
		# Проверяем, присутствует ли этот элемент во втором и третьем массивах
		if coord in Global.coordinates_with_block_kirpich or coord in Global.kamenniy_block_s_blokami_ot_mobov:
			# Если элемент присутствует во всех массивах, добавляем его в результирующий массив
			Global.down_coordinate_dla_lazera_zanatie_blokami_MOB.append(coord)
			
	# В массив будут добавлены координаты выше блоков
	for coordinate in Global.down_coordinate_dla_lazera_MOB:
		# Флаг, указывающий, что текущий элемент подходит по условию
		var suitable = true
		# Проверяем координату x текущего элемента
		for block_coordinate in Global.down_coordinate_dla_lazera_zanatie_blokami_MOB:
			if coordinate.y >= block_coordinate.y:
				suitable = false
				break
	# Если текущий элемент удовлетворяет условию, добавляем его в массив
		if suitable:
			Global.down_coordinate_dla_lazera_s_uchetom_blokov_MOB.append(coordinate)	

	# Спаун лазера не будет в крайней свободной нижней координате
	for coordinate in Global.down_coordinate_dla_lazera_s_uchetom_blokov_MOB:
		if coordinate != Global.down_kraynaa_down_coordinate_dla_lazera_MOB:
			var new_lazer_down2 = lazer_vertical.instantiate()
			get_parent().add_child(new_lazer_down2)
			new_lazer_down2.global_position = coordinate
	
	# Спаун наконечника лазера, если он должен быть
	if Global.down_coordinate_dla_lazera_s_uchetom_blokov_MOB.has(Global.down_kraynaa_down_coordinate_dla_lazera_MOB):
		var new_lazer_konec_down = lazer_konec_down.instantiate()
		get_parent().add_child(new_lazer_konec_down)
		new_lazer_konec_down.global_position = Global.down_kraynaa_down_coordinate_dla_lazera_MOB
		# #######################################################################
	Global.vkluchit_Zvuk_B = true
