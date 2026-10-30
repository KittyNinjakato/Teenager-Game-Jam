extends Node

@onready var main_music: AudioStreamPlayer2D = $main_music
@onready var start_menu_music: AudioStreamPlayer2D = $Start_menu_music
@onready var death_music: AudioStreamPlayer2D = $death_music


#MAIN THEME
func play_main_music():
	main_music.play()

func stop_main_music():
	main_music.stop()


#START MENU THEME
func play_start_menu_music():
	start_menu_music.play()

func stop_start_menu_music():
	start_menu_music.stop()


#DEATH THEME
func play_death_music():
	death_music.play()

func stop_death_music():
	death_music.stop()
	
	
	
	
	
	
	
	
	
