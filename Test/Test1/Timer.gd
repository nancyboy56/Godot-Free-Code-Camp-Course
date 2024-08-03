extends Timer

var Cherry = preload("res://Collectable/Cherry.tscn")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_timeout():
	print("Add cherry")
	var cherryTemp = Cherry.instantiate()
	var rng = RandomNumberGenerator.new()
	var x = rng.randi_range(10, 1000)
	var y = rng.randi_range(200, 370)
	cherryTemp.position = Vector2(x, y)
	add_child(cherryTemp)
	

