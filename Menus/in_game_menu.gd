extends CanvasLayer
	
func _process(_delta: float) -> void:
	$HBoxContainer/MarginContainer2/Score.text = "SCORE: 	" + str(GlobalVars.score)
	$HBoxContainer/MarginContainer3/HightScore.text = "HIGHT SCORE: " + str(GlobalVars.hi_score)
