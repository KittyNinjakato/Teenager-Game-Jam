extends Node


var gub = null
#states the variable gub so it can be accessed anywhere
var essence = 0
var health = 0
@export var slime_death = 0 #how many slimes have died

@export var wave_num = 11 #what wave we are on
#*******************************************************
#this array holds how many slimes spawn per wave starting at 0
@export var slimes_per_wave = [5,12,18,21,30,1,10,20,45,50,58,11,10,20,30,62,67, 3,20,40,69,82,88,55,5,20, 10,92,100,103,180,250,500,2000,6969,58008,1]
#*******************************************************
@export var OSCAR_per_wave =  [0, 0, 0, 0, 0,1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 3, 0, 0, 0, 0, 0, 1,0, 0, 10, 0, 0 , 20,  0, 20,500,2000,   0,  100,0]
var wave_end = false #sees if the wave has ended

func _wave_counter():#counts how many slimes have died and sees if all slimes have died 
	slime_death += 1
	wave_end = false
	if slime_death == slimes_per_wave[wave_num]:
		
		reset()
		
func reset():
	slime_death = 0
	wave_end = true
	
	
