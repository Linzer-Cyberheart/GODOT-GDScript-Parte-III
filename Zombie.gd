extends Node2D


func _ready():
	$AnimationPlayer.play("Zombie")


func _on_Area2D_body_entered(body):
	if body == Global.Player:
		$Area2D/AnimatedSprite/Timer.start()


func _on_Area2D_body_exited(body):
	if body == Global.Player:
		$Area2D/AnimatedSprite/Timer.stop()
	

func _on_Timer_timeout():
	$Area2D/AnimatedSprite/AudioStreamPlayer.play()
	
func diezombie():
	if Global.patrol == true:
		queue_free()

func diealready():
	if Global.Player.has_node("Paxton"):
		queue_free()
		
