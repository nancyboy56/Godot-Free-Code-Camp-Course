extends Area2D




func _on_body_entered(body):
	if body.name =="Player":
		Game.gold +=3
		var tween = get_tree().create_tween()
		var tween1 = get_tree().create_tween()
		tween.tween_property(self, "position", position - Vector2(0, 50), 0.5)
		tween1.tween_property(self, "modeulate:a", 0, 0.5)
		tween.tween_callback(queue_free)
		


func _on_body_exited(body):
	pass # Replace with function body.
