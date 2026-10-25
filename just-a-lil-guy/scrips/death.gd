extends Node2D


func _on_main_menu_pressed():
	reset()
	get_tree().change_scene_to_file("res://scenes/start menu.tscn")


func _on_try_again_pressed():
	reset()
	get_tree().change_scene_to_file("res://scenes/game.tscn")

func reset():
	Global.slime_death = 0
	Global.wave_end = false
	Global.wave_num = 0
