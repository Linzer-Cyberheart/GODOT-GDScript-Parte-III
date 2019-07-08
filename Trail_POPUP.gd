extends CanvasLayer

var x = false

func _ready():
	$Popup.hide()

func _on_Trail_body_entered(body):
	if body == Global.Player and x == false:
		$Popup.show()
		$AnimationPlayer.play("Trail")
		x = true

func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()