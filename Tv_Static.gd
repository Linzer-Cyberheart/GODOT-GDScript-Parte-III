extends Node2D

var active = false
var active2 = false


func _ready():
	$Light2D.enabled = false


func _on_Area2D_body_entered(body):
	if body == Global.Player and active == false:
		$Timer.start()
		$Light2D.enabled = true
		$TV_Static_SFX.play()
		active = true


func _on_Timer_timeout():
	$Light2D.enabled = false
	$TV_Static_SFX.stop()
	


func _on_Area2D2_body_entered(body):
	if body == Global.Player and active2 == false:
		$Timer.start()
		$Light2D.enabled = true
		$TV_Static_SFX.play()
		active2 = true