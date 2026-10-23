extends Area2D

var velocity = Vector2()
var clickable:bool = false
@onready var speed:float = 50
var hp:int = 5
var player_dmg = 1
var min_essence:int = 2
var max_essence:int = 5
var essence_dropped:int = 0
var rng = RandomNumberGenerator.new()

@onready var slime: Area2D = $"."
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var game_manager: Node = %game_manager



#tracks if slime is allowed to be clicked
func _on_mouse_entered() -> void:
	clickable = true
	
#tracks if slime is allowed to be clicked
func _on_mouse_exited() -> void:
	clickable = false

	
	#if mouse is on slime
	if clickable:
		if Input.is_action_just_pressed("click"): #if clicked
			hp -= player_dmg #deal damage to health
			animated_sprite.play("takes_dmg") #play damage animation
			if hp <= 0: #if drops to 0 health
				var essence_dropped = rng.randf_range(min_essence,max_essence) #random num between min and max
				game_manager.get_essence(essence_dropped) #essence added to collected essence
				queue_free() #delete slime


#when any animation is finished
func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite.play("idle")
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if Global.gub != null:
		velocity = global_position.direction_to(Global.gub.global_position)
	
	global_position += velocity * speed * delta
	
