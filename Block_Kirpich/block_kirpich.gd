extends StaticBody2D

@onready var anim = $AnimatedSprite2D

var mob_list = []  # Список для хранения ссылок на все мобы, которые будут уничтожены

func destroy():
	for mob in mob_list:
		mob.destroy()
	mob_list.clear()
	anim.play()
	anim.animation_finished.connect(_on_animated_sprite_2d_animation_finished)

func _on_animated_sprite_2d_animation_finished():
	# Получаем координаты текущего блока
	var block_position = self.get_position()
	
	# Удаляем координаты блока из глобального массива
	var new_coordinates_with_block_kirpich = []
	for coord in Global.coordinates_with_block_kirpich:
		if coord != block_position:
			new_coordinates_with_block_kirpich.append(coord)
	Global.coordinates_with_block_kirpich = new_coordinates_with_block_kirpich
	queue_free()
	
func _on_area_2d_body_entered(mob_meduza):
	mob_list.append(mob_meduza)

func _on_area_2d_2_body_entered(mob_prividenie):
	mob_list.append(mob_prividenie)
	
func _on_area_2d_body_exited(mob_meduza):
	mob_list.erase(mob_meduza)
	
func _on_area_2d_2_body_exited(mob_prividenie):
	mob_list.erase(mob_prividenie)
	
func _on_area_2d_3_body_entered(mob_monetka):
	mob_list.append(mob_monetka)
	
func _on_area_2d_3_body_exited(mob_monetka):
	mob_list.erase(mob_monetka)
