extends Node2D

var damage = 10

func _on_Damage_Area_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
