extends Node2D


func _on_main_menu_pressed():
	reset()
	get_tree().change_scene_to_file("res://scenes/start menu.tscn")
	music_player.stop_death_music() #stop death music
	music_player.play_start_menu_music() #start menu music
	

func _on_try_again_pressed():
	reset()
	get_tree().change_scene_to_file("res://scenes/game.tscn")
	music_player.stop_death_music() #stop death music
	music_player.play_main_music() #start main music

func reset():
	game_manager.reset_stats()
	Global.slime_death = 0
	Global.wave_end = false
	Global.wave_num = 0
