extends TextureButton
class_name SkillNode

@onready var panel: Panel = $Panel
@onready var line_2d: Line2D = $Line2D
@onready var game_manager: Node = $"/root/Node2D/game_manager"


#connects skill nodes with each other somehow
func _ready():
	if get_parent() is SkillNode:
		line_2d.add_point(global_position + size/2)
		line_2d.add_point(get_parent().global_position + size/2)
		line_2d.z_index = 5



#when any button is pressed
func _on_pressed():
	
	#var skill_pressed:String = get_meta("Skill_name") #name of the button pressed
	var essence_cost:int = get_meta("essence_cost") #cost of button pressed to buy
	var already_bought:bool = get_meta("Bought") #if button has already been purchased
	
	
	#attempts to buy skill
	var purchase_attempt:String = game_manager.spend_essence(essence_cost,already_bought) #pass = success, fail = too broke

	if purchase_attempt == "pass" and not already_bought: #if rich enough and not already purchased
		set_meta("Bought",true)
		

		panel.show_behind_parent = true
		
		line_2d.default_color = Color(0.006, 0.681, 0.731, 1.0) #change corresponding line to active
		
		var skills = get_children() #get all the child nodes and store in skills
		for skill in skills: #iterate thorugh all the nodes
			if skill is SkillNode: #if its a skill button
				skill.disabled = false #enable it
			if skill is Label: #if its a cost label
				skill.visible = false #make label invis
	
	
