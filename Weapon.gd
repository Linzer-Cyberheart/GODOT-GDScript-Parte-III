extends Area2D


func _on_Weapon_body_entered(body):
	if body == Global.Player:
		Global.Player.collect_gun()
		queue_free()
