extends TextureButton
class_name SkillNode

@onready var panel: Panel = $Panel
@onready var line_2d: Line2D = $Line2D


#will run once for every button in skill tree
func _ready() -> void:
	
	#connects skill nodes with each other somehow
	if get_parent() is SkillNode:
		line_2d.add_point(global_position + size/2)
		line_2d.add_point(get_parent().global_position + size/2)
		line_2d.z_index = -1



	#renews skill tree data
	var purchased_skills = game_manager.get_purchased_skills() #get array of purchased skills
	var skill_name:String = get_meta("Skill_name")
	
	print(purchased_skills) 
	for skill in purchased_skills:
		
		if skill_name in purchased_skills: #if 
			
			set_meta("Bought",true) #set skill metadata to bought
			panel.show_behind_parent = true
			line_2d.default_color = Color(0.006, 0.681, 0.731, 1.0) #change corresponding line to active
			
			var skill_children = get_children() #get all the child nodes and store in skills
			for child in skill_children: #iterate thorugh all the nodes
				if child is SkillNode: #if its a skill button
					child.disabled = false #enable it
				if child is Label: #if its a cost label
					child.visible = false #make label invis
		
		



#when any button is pressed
func _on_pressed():

	var skill_name:String = get_meta("Skill_name") #name of the button pressed
	var essence_cost:int = get_meta("essence_cost") #cost of button pressed to buy
	var already_bought:bool = get_meta("Bought") #if button has already been purchased

	#attempts to buy skill
	var purchase_attempt:String = game_manager.spend_essence(essence_cost,already_bought) #pass = success, fail = too broke

	if purchase_attempt == "pass" and not already_bought: #if rich enough and not already purchased
		set_meta("Bought",true) #set skill metadata to bought
		
		game_manager.store_purchased_skill(skill_name) #add the skill bought to an array of bought skills

		panel.show_behind_parent = true
		
		line_2d.default_color = Color(0.006, 0.681, 0.731, 1.0) #change corresponding line to active
		
		var skills = get_children() #get all the child nodes and store in skills
		for skill in skills: #iterate thorugh all the nodes
			if skill is SkillNode: #if its a skill button
				skill.disabled = false #enable it
			if skill is Label: #if its a cost label
				skill.visible = false #make label invis
	
	
