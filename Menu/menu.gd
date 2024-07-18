extends Control

func _ready():
	$Zastavka_sound.play()

func _on_check_box_toggled(toggled_on):
	if toggled_on:
		Global.mob_pulki = true
	else:
		Global.mob_pulki = false
		
func _on_check_box_2_toggled(toggled_on):
	if toggled_on:
		Global.novie_mobi = true
	else:
		Global.novie_mobi = false
	
func _on_check_box_3_toggled(toggled_on):
	if toggled_on:
		Global.vtoroy_player = true
	else:
		Global.vtoroy_player = false
		
func _on_play_pressed():
	get_tree().change_scene_to_file("res://Menu_nomer_stage/menu_nomer_stage.tscn")

func _on_quit_pressed():
	get_tree().quit()

func _on_option_button_item_selected(index):
	Global.stage_nomer = index + 1
	
func _on_option_button_lazer_item_selected(index):
	Global.dlina_lazera_nomer = index + 1
	Global.dlina_lazera = (index + 1) * 48
		
func _on_option_button_bomb_item_selected(index):
	Global.maximum_b = index + 1 
	Global.maximum_b_player_2 = index + 1

func _on_option_button_speed_item_selected(index):
	Global.speed = 170 + (30 * index)

func _on_check_box_4_toggled(toggled_on):
	if toggled_on:
		Global.player_skvoz_steni = 72 
	else:
		Global.player_skvoz_steni = 76
		
func _on_check_box_5_toggled(toggled_on):
	if toggled_on:
		Global.vzal_item_knopka = true 
	else:
		Global.vzal_item_knopka = false
	
func _on_option_button_enemy_item_selected(index):
	if index == 0:
		Global.more_enemy = 1
	elif index == 1:
		Global.more_enemy = 1.5
	elif index == 2:
		Global.more_enemy = 2
	elif index == 3:
		Global.more_enemy = 2.5
	elif index == 4:
		Global.more_enemy = 3

func _on_check_box_6_toggled(toggled_on):
	if toggled_on:
		Global.item_flamepass = true
	else:
		Global.item_flamepass = false
		
func _on_option_button_life_item_selected(index):
	Global.chislo_gizney = index + 2
	
		
