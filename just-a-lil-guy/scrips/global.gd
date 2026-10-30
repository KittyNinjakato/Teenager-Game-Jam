extends Node

var gub = null
#states the variable gub so it can be accessed anywhere

@export var slime_death = 0 #how many slimes have died

@export var wave_num = 0 #what wave we are on

#@onready var mouse_canvas_layer: CanvasLayer = %Mouse_Canvas_layer
#@onready var mouse: Sprite2D = $Mouse_Canvas_layer/Mouse
#@export var mouse_position = mouse.get_viewport()

#*******************************************************
#this array holds how many slimes spawn per wave starting at 0
@export var slimes_per_wave = [5,12,18,21,30,45,58,69,100,130,180,250,500,2000,6969,58008,1]
#*******************************************************
var wave_end = false #sees if the wave has ended

func _wave_counter():#counts how many slimes have died and sees if all slimes have died 
	slime_death += 1
	wave_end = false
	if slime_death == slimes_per_wave[wave_num]:
		
		reset()
		
func reset():
	slime_death = 0
	wave_end = true
