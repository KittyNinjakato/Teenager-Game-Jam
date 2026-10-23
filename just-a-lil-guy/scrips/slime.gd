extends Area2D

var clickable:bool = false
var speed:float = 10
var hp:int = 5
var player_dmg = 1

@onready var slime: Area2D = $"."
@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D



#tracks if slime is allowed to be clicked
func _on_mouse_entered() -> void:
	clickable = true
	
#tracks if slime is allowed to be clicked
func _on_mouse_exited() -> void:
	clickable = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:

	#if mouse is on slime
	if clickable:
		if Input.is_action_just_pressed("click"): #if clicked
			hp -= player_dmg #deal damage to health
			animated_sprite.play("takes_dmg")
			if hp <= 0: #if drops to 0 health
				queue_free()
	#animated_sprite.play("idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	
	#POSITION STUFF IS TEMPORARY UNTIL PROPER MOVEMENT IS MADE
	position += Vector2.RIGHT * speed * delta #move right based on speed

func _on_animated_sprite_2d_animation_finished() -> void:
	animated_sprite.play("idle")
