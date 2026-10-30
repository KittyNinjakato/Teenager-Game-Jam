extends Control

func _ready() -> void:
	game_manager.reset_stats()

#when start button pressed
func _on_button_pressed():
	get_tree().change_scene_to_file("res://scenes/game.tscn") #swap to game scene
	
	music_player.stop_start_menu_music() #stop menu music
	music_player.play_main_music() #start main music
	
