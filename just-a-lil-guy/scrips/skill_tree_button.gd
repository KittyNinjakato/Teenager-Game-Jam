extends TextureButton
class_name SkillNode

@onready var panel: Panel = $Panel
#@onready var label: Label = $MarginContainer/Label
@onready var line_2d: Line2D = $Line2D

#connects skill nodes with each other somehow
func _ready():
	if get_parent() is SkillNode:
		line_2d.add_point(global_position + size/2)
		line_2d.add_point(get_parent().global_position + size/2)
		line_2d.z_index = 5


var bought:bool = false

#when a button is pressed
func _on_pressed() -> void:
	bought = true
	
	panel.show_behind_parent = true
	
	line_2d.default_color = Color(0.006, 0.681, 0.731, 1.0) #change corresponding line to active
	
	var skills = get_children() #get all the child nodes and store in skills
	for skill in skills: #iterate thorugh all the nodes
		if skill is SkillNode and bought == true: #if its a skill button and lvl 1
			skill.disabled = false #enable it
	
	
	
	
