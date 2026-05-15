extends CanvasLayer

func _process(_delta):
	# Update the label with current score from Global script
	$ScoreLabel.text = "Score: " + str(Global.score)
