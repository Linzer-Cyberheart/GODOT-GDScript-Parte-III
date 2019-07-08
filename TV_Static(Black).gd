extends Area2D


func _ready():
	$Sprite/Light2D.hide()

var enter = false

func _on_TV_StaticBlack_body_entered(body):
	if body == Global.Player and enter == false:
		$Timer.start()
		$Sprite/Light2D.show()
		$Sprite/Light2D.enabled
		$Sprite/Static_SFX.play()
		enter = true

func _on_Timer_timeout():
	queue_free()
