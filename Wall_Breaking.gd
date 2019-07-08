extends Node2D

var force = false
var damage = 50

func _ready():
	
	$Fire/Bonfire/DamageArea/CollisionShape2D.disabled = true
	$Fire/Bonfire2/DamageArea/CollisionShape2D.disabled = true
	$Fire/Bonfire3/DamageArea/CollisionShape2D.disabled = true
	$Fire/Bonfire4/DamageArea/CollisionShape2D.disabled = true
	$Fire/Bonfire5/DamageArea/CollisionShape2D.disabled = true
	$Fire/Bonfire6/DamageArea/CollisionShape2D.disabled = true
	$Fire/Bonfire7/DamageArea/CollisionShape2D.disabled = true
	
	$Fire/Bonfire/Fire_SFX.playing = false
	$Fire/Bonfire2/Fire_SFX.playing = false
	$Fire/Bonfire3/Fire_SFX.playing = false
	$Fire/Bonfire4/Fire_SFX.playing = false
	$Fire/Bonfire5/Fire_SFX.playing = false
	$Fire/Bonfire6/Fire_SFX.playing = false
	$Fire/Bonfire7/Fire_SFX.playing = false

func _on_ActivatedArea_body_entered(body):
	if Global.Phone1 == true and Global.Phone3 == true and Global.Phone4 == true and Global.Phone5 == true:
		if body == Global.Player and force == false:
			
			$AnimationPlayer.play("Alma's Force")
			
			$Fire/Bonfire/DamageArea/CollisionShape2D.disabled = false
			$Fire/Bonfire2/DamageArea/CollisionShape2D.disabled = false
			$Fire/Bonfire3/DamageArea/CollisionShape2D.disabled = false
			$Fire/Bonfire4/DamageArea/CollisionShape2D.disabled = false
			$Fire/Bonfire5/DamageArea/CollisionShape2D.disabled = false
			$Fire/Bonfire6/DamageArea/CollisionShape2D.disabled = false
			$Fire/Bonfire7/DamageArea/CollisionShape2D.disabled = false
			
			$Fire/Bonfire/Fire_SFX.playing = true
			$Fire/Bonfire2/Fire_SFX.playing = true
			$Fire/Bonfire3/Fire_SFX.playing = true
			$Fire/Bonfire4/Fire_SFX.playing = true
			$Fire/Bonfire5/Fire_SFX.playing = true
			$Fire/Bonfire6/Fire_SFX.playing = true
			$Fire/Bonfire7/Fire_SFX.playing = true
			
			if body.has_method("take_damage"):
				body.take_damage(damage)
			force = true