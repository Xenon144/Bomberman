extends CharacterBody2D

var points: Array[Vector2] = [
	Vector2(72, 168),
	Vector2(120, 168),
	Vector2(168, 168),
	Vector2(216, 168),
	Vector2(264, 168),
	Vector2(312, 168),
	Vector2(360, 168),
	Vector2(408, 168),
	Vector2(456, 168),
	Vector2(504, 168),
	Vector2(552, 168),
	Vector2(600, 168),
	Vector2(648, 168),
	Vector2(696, 168),
	Vector2(744, 168),
	Vector2(792, 168),
	Vector2(840, 168),
	Vector2(888, 168),
	Vector2(936, 168),
	Vector2(984, 168),
	Vector2(1032, 168),
	Vector2(1080, 168),
	Vector2(1128, 168),
	Vector2(1176, 168),
	Vector2(1224, 168),
	Vector2(1272, 168),
	Vector2(1320, 168),
	Vector2(1368, 168),
	Vector2(1416, 168),
	
	Vector2(72, 216),
	Vector2(168, 216),
	Vector2(264, 216),
	Vector2(360, 216),
	Vector2(456, 216),
	Vector2(552, 216),
	Vector2(648, 216),
	Vector2(744, 216),
	Vector2(840, 216),
	Vector2(936, 216),
	Vector2(1032, 216),
	Vector2(1128, 216),
	Vector2(1224, 216),
	Vector2(1320, 216),
	Vector2(1416, 216),
	
	Vector2(72, 264),
	Vector2(120, 264),
	Vector2(168, 264),
	Vector2(216, 264),
	Vector2(264, 264),
	Vector2(312, 264),
	Vector2(360, 264),
	Vector2(408, 264),
	Vector2(456, 264),
	Vector2(504, 264),
	Vector2(552, 264),
	Vector2(600, 264),
	Vector2(648, 264),
	Vector2(696, 264),
	Vector2(744, 264),
	Vector2(792, 264),
	Vector2(840, 264),
	Vector2(888, 264),
	Vector2(936, 264),
	Vector2(984, 264),
	Vector2(1032, 264),
	Vector2(1080, 264),
	Vector2(1128, 264),
	Vector2(1176, 264),
	Vector2(1224, 264),
	Vector2(1272, 264),
	Vector2(1320, 264),
	Vector2(1368, 264),
	Vector2(1416, 264),
	
	Vector2(72, 312),
	Vector2(168, 312),
	Vector2(264, 312),
	Vector2(360, 312),
	Vector2(456, 312),
	Vector2(552, 312),
	Vector2(648, 312),
	Vector2(744, 312),
	Vector2(840, 312),
	Vector2(936, 312),
	Vector2(1032, 312),
	Vector2(1128, 312),
	Vector2(1224, 312),
	Vector2(1320, 312),
	Vector2(1416, 312),
	
	Vector2(72, 360),
	Vector2(120, 360),
	Vector2(168, 360),
	Vector2(216, 360),
	Vector2(264, 360),
	Vector2(312, 360),
	Vector2(360, 360),
	Vector2(408, 360),
	Vector2(456, 360),
	Vector2(504, 360),
	Vector2(552, 360),
	Vector2(600, 360),
	Vector2(648, 360),
	Vector2(696, 360),
	Vector2(744, 360),
	Vector2(792, 360),
	Vector2(840, 360),
	Vector2(888, 360),
	Vector2(936, 360),
	Vector2(984, 360),
	Vector2(1032, 360),
	Vector2(1080, 360),
	Vector2(1128, 360),
	Vector2(1176, 360),
	Vector2(1224, 360),
	Vector2(1272, 360),
	Vector2(1320, 360),
	Vector2(1368, 360),
	Vector2(1416, 360),
	
	Vector2(72, 408),
	Vector2(168, 408),
	Vector2(264, 408),
	Vector2(360, 408),
	Vector2(456, 408),
	Vector2(552, 408),
	Vector2(648, 408),
	Vector2(744, 408),
	Vector2(840, 408),
	Vector2(936, 408),
	Vector2(1032, 408),
	Vector2(1128, 408),
	Vector2(1224, 408),
	Vector2(1320, 408),
	Vector2(1416, 408),
	
	Vector2(72, 456),
	Vector2(120, 456),
	Vector2(168, 456),
	Vector2(216, 456),
	Vector2(264, 456),
	Vector2(312, 456),
	Vector2(360, 456),
	Vector2(408, 456),
	Vector2(456, 456),
	Vector2(504, 456),
	Vector2(552, 456),
	Vector2(600, 456),
	Vector2(648, 456),
	Vector2(696, 456),
	Vector2(744, 456),
	Vector2(792, 456),
	Vector2(840, 456),
	Vector2(888, 456),
	Vector2(936, 456),
	Vector2(984, 456),
	Vector2(1032, 456),
	Vector2(1080, 456),
	Vector2(1128, 456),
	Vector2(1176, 456),
	Vector2(1224, 456),
	Vector2(1272, 456),
	Vector2(1320, 456),
	Vector2(1368, 456),
	Vector2(1416, 456),
	
	Vector2(72, 504),
	Vector2(168, 504),
	Vector2(264, 504),
	Vector2(360, 504),
	Vector2(456, 504),
	Vector2(552, 504),
	Vector2(648, 504),
	Vector2(744, 504),
	Vector2(840, 504),
	Vector2(936, 504),
	Vector2(1032, 504),
	Vector2(1128, 504),
	Vector2(1224, 504),
	Vector2(1320, 504),
	Vector2(1416, 504),
	
	Vector2(72, 552),
	Vector2(120, 552),
	Vector2(168, 552),
	Vector2(216, 552),
	Vector2(264, 552),
	Vector2(312, 552),
	Vector2(360, 552),
	Vector2(408, 552),
	Vector2(456, 552),
	Vector2(504, 552),
	Vector2(552, 552),
	Vector2(600, 552),
	Vector2(648, 552),
	Vector2(696, 552),
	Vector2(744, 552),
	Vector2(792, 552),
	Vector2(840, 552),
	Vector2(888, 552),
	Vector2(936, 552),
	Vector2(984, 552),
	Vector2(1032, 552),
	Vector2(1080, 552),
	Vector2(1128, 552),
	Vector2(1176, 552),
	Vector2(1224, 552),
	Vector2(1272, 552),
	Vector2(1320, 552),
	Vector2(1368, 552),
	Vector2(1416, 552),
	
	Vector2(72, 600),
	Vector2(168, 600),
	Vector2(264, 600),
	Vector2(360, 600),
	Vector2(456, 600),
	Vector2(552, 600),
	Vector2(648, 600),
	Vector2(744, 600),
	Vector2(840, 600),
	Vector2(936, 600),
	Vector2(1032, 600),
	Vector2(1128, 600),
	Vector2(1224, 600),
	Vector2(1320, 600),
	Vector2(1416, 600),
	
	Vector2(72, 648),
	Vector2(120, 648),
	Vector2(168, 648),
	Vector2(216, 648),
	Vector2(264, 648),
	Vector2(312, 648),
	Vector2(360, 648),
	Vector2(408, 648),
	Vector2(456, 648),
	Vector2(504, 648),
	Vector2(552, 648),
	Vector2(600, 648),
	Vector2(648, 648),
	Vector2(696, 648),
	Vector2(744, 648),
	Vector2(792, 648),
	Vector2(840, 648),
	Vector2(888, 648),
	Vector2(936, 648),
	Vector2(984, 648),
	Vector2(1032, 648),
	Vector2(1080, 648),
	Vector2(1128, 648),
	Vector2(1176, 648),
	Vector2(1224, 648),
	Vector2(1272, 648),
	Vector2(1320, 648),
	Vector2(1368, 648),
	Vector2(1416, 648)]

var block = preload("res://Block/block.tscn")
const speed: int = 50
var napravlenie_dvigenia: Vector2 = Vector2.ZERO
var izmenitj_napravlenie_glaz = 0

@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
var glaza_right: String = "glaza_right"
var glaza_left: String = "glaza_left"

func _ready():
	# Выбираем случайное направление при создании объекта
	var random_number = RandomNumberGenerator.new()
	random_number.randomize() # Инициализируем генератор случайных чисел
	var selected_number = random_number.randi_range(1, 4) 
	
	if selected_number == 1:
		napravlenie_dvigenia = Vector2.UP
		anim.play(glaza_left)
		izmenitj_napravlenie_glaz = 1
	elif selected_number == 2:
		napravlenie_dvigenia = Vector2.DOWN
		anim.play(glaza_left) 
		izmenitj_napravlenie_glaz = 1
	elif selected_number == 3:
		napravlenie_dvigenia = Vector2.LEFT
		anim.play(glaza_left)
		izmenitj_napravlenie_glaz = 1
	elif selected_number == 4:
		napravlenie_dvigenia = Vector2.RIGHT
		anim.play(glaza_right)
		izmenitj_napravlenie_glaz = 2
	
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
			if izmenitj_napravlenie_glaz == 1:
				izmenitj_napravlenie_glaz = 2
				anim.play(glaza_right)
			elif izmenitj_napravlenie_glaz == 2:
				izmenitj_napravlenie_glaz = 1
				anim.play(glaza_left)
		elif selected_number == 2:
			napravlenie_dvigenia = Vector2.DOWN
			if izmenitj_napravlenie_glaz == 1:
				izmenitj_napravlenie_glaz = 2
				anim.play(glaza_right)
			elif izmenitj_napravlenie_glaz == 2:
				izmenitj_napravlenie_glaz = 1
				anim.play(glaza_left)
		elif selected_number == 3:
			napravlenie_dvigenia = Vector2.LEFT
			anim.play(glaza_left)
		elif selected_number == 4:
			napravlenie_dvigenia = Vector2.RIGHT
			anim.play(glaza_right)

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
					if izmenitj_napravlenie_glaz == 1:
						izmenitj_napravlenie_glaz = 2
						anim.play(glaza_right)
					elif izmenitj_napravlenie_glaz == 2:
						izmenitj_napravlenie_glaz = 1
						anim.play(glaza_left)
				elif selected_number2 == 2:
					napravlenie_dvigenia = Vector2.DOWN
					if izmenitj_napravlenie_glaz == 1:
						izmenitj_napravlenie_glaz = 2
						anim.play(glaza_right)
					elif izmenitj_napravlenie_glaz == 2:
						izmenitj_napravlenie_glaz = 1
						anim.play(glaza_left)
				elif selected_number2 == 3:
					napravlenie_dvigenia = Vector2.LEFT
					anim.play(glaza_left)
				elif selected_number2 == 4:
					napravlenie_dvigenia = Vector2.RIGHT
					anim.play(glaza_right)

func destroy():
	queue_free()
	var nearest_point = points[0] 
	var min_distance = global_position.distance_to(nearest_point)
	for point in points:
		var distance = global_position.distance_to(point)
		if distance < min_distance:
			min_distance = distance
			nearest_point = point
		
	Global.massiv_vse_sozdannie_mobi.erase(self) # Удаляю из глобального массива моба, который был уничтожен
	var new_block = block.instantiate()
	get_parent().add_child(new_block)
	new_block.global_position = nearest_point
	Global.massiv_block_mobi.append(new_block)
	Global.kamenniy_block_s_blokami_ot_mobov.append(new_block.global_position)
	
func _on_area_2d_body_entered(player):
	if player.has_method("destroy") and not player.has_been_destroyed:
		player.destroy()
