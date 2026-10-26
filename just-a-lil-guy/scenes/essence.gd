extends RichTextLabel


func _process(delta: float):
	$".".text = str(Global.essence)
