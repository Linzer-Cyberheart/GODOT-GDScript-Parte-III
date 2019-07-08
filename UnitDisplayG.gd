extends Node2D

func _ready():
	$BloodStep.hide()
#	for node in get_children():
#		node.hide()

func _process(delta):
	global_rotation = 0

func _on_Ghost_health_changed(value):
	$HealthMeter.texture_progress = load("res://GFX/Interface/PNG/greenbar.png")
	var v1 = false
	var v2 = false
	var g1 = false
	var g2 = false
	var g3 = false
	var g4 = false
	var g5 = false
	if value < 90 and g1 == false:
		g1 == true
	if value < 80 and g1 == true:
		g1 = null
	if value < 70 and g2 == false:
		g2 = true
	if value < 60 and v1 == false:
		$HealthMeter.texture_progress = load("res://GFX/Interface/PNG/yellowbar.png")
		v1 = true
	if value < 50 and g2 == true:
		g2 = null
	if value < 40 and g3 == false:
		g3 = true
	if value < 30 and g3 == true:
		g3 = null
	if value < 25 and v2 == false:
		$HealthMeter.texture_progress = load("res://GFX/Interface/PNG/redbar.png")
		v2 = true
	if value < 15 and g4 == false:
		g4 = true
	if value < 10 and g5 == false:
		g5 = true
	if value <= 0:
		$HealthMeter.texture_progress = load("res://GFX/Interface/PNG/barborder.png")
	if value < 100:
		$HealthMeter.show()
	$HealthMeter.value = value

