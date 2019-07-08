extends Node2D

func _ready():
	$BloodStep.hide()
#	for node in get_children():
#		node.hide()

func _process(delta):
	global_rotation = 0

func updatehealthmeter(value):
	$HealthMeter.texture_progress = load("res://GFX/Interface/PNG/greenbar.png")
	var v1 = false
	var v2 = false
	var g1 = false
	var g2 = false
	var g3 = false
	var g4 = false
	var g5 = false
	if value < 90 and g1 == false:
		$Gore1/Blood.play("Bloody")
		g1 == true
	if value < 80 and g1 == true:
		$Gore2/Blood.play("Bloody")
		g1 = null
	if value < 70 and g2 == false:
		$Gore3/Blood.play("Bloody")
		g2 = true
	if value < 60 and v1 == false:
		$Gore4/Blood.play("Bloody")
		$BloodStep.show()
		$VoiceClosing.play()
		$HealthMeter.texture_progress = load("res://GFX/Interface/PNG/yellowbar.png")
		v1 = true
	if value < 50 and g2 == true:
		$Gore5/Blood.play("Bloody")
		g2 = null
	if value < 40 and g3 == false:
		$Gore6/Blood.play("Bloody")
		g3 = true
	if value < 30 and g3 == true:
		$Gore7/Blood.play("Bloody")
		g3 = null
	if value < 25 and v2 == false:
		$Gore8/Blood.play("Bloody")
		$VoiceClosing.stop()
		$VoiceCover.play()
		$HealthMeter.texture_progress = load("res://GFX/Interface/PNG/redbar.png")
		v2 = true
	if value < 15 and g4 == false:
		$Gore9/Blood.play("Bloody")
		g4 = true
	if value < 10 and g5 == false:
		$GoreFinal/Blood.play("Bloody")
		g5 = true
	if value < 5 and g4 == true:
		$GoreFinal/Blood.play("Bloody")
	if value <= 0:
		$GoreFinal/Blood.play("BloodyFinal")
		$BloodStep.hide()
		$VoiceClosing.stop()
		$VoiceCover.stop()
		$HealthMeter.texture_progress = load("res://GFX/Interface/PNG/barborder.png")
	if value < 100:
		$HealthMeter.show()
	$HealthMeter.value = value
extends Node2D

