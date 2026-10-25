extends RichTextLabel
const time_to_display_seconds: float = 3
var message = "You managed to protect Gubb until wave " 

func _ready() -> void:
	$".".text = message + str(Global.wave_num) 
	visible_ratio = 0.0
	var tween: Tween = create_tween()
	tween.set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(
		self,
		"visible_ratio",
		1.0,
		time_to_display_seconds
	)
	
