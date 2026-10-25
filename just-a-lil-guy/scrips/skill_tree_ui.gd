extends Control


func _on_next_wave_pressed():#returns the player back to the game
	get_tree().change_scene_to_file("res://scenes/game.tscn")
