extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#Utils.save_game()
	#Utils.load_game()
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_quit_pressed():
	get_tree().quit()
	# pass # Replace with function body.


func _on_play_pressed():
	get_tree().change_scene_to_file("res://world.tscn")
	# pass # Replace with function body.
