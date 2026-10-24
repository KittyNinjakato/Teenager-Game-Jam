extends Node

var gub = null
#states the variable gub so it can be accessed anywhere

@export var slime_death = 0
@export var wave_num = 0
@export var slimes_per_wave = [5,12,18,21,30]
var wave_end = false

func _wave_counter():
	slime_death += 1
	print(wave_end)
	wave_end = false
	
	if slime_death == slimes_per_wave[wave_num]:
		
		reset()
		
func reset():
	slime_death = 0
	wave_end = true
	
