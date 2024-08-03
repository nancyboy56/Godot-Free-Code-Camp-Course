extends CharacterBody2D

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var player
var chase = false;
var SPEED = 50
var damage = 3
var sprites
# Called when the node enters the scene tree for the first time.
func _ready():
	sprites = get_node("AnimatedSprite2D")
	sprites.play("Idle")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_process(delta):
	velocity.y += gravity * delta
	
	if chase:
		
		if sprites.animation != "Death":
			sprites.play("Jump")
		player = get_node("../../Player Character/Player")
		var direction = (player.position- self.position).normalized()
		if direction.x > 0:
			sprites.flip_h = true
			#print("Right")

			
				
		else:
			sprites.flip_h = false
			#print("Left")
		velocity.x += direction.x * delta * SPEED
	else:
		if sprites.animation != "Death":
			sprites.play("Idle")
		velocity.x = 0;
		chase = false
		#print(player.global_position)
	
	# this makes the sprite actually fall lol
	move_and_slide()


func _on_player_detection_body_entered(body):
	if body.name == "Player":
		chase = true
	
		

		


func _on_player_detection_body_exited(body):
	if body.name == "Player":
		chase = false


func _on_player_death_body_entered(body):
	
	if body.name == "Player":
		death()
	pass # Replace with function body.


func _on_player_death_body_exited(body):
	
	pass # Replace with function body.


func _on_player_collision_body_entered(body):
	if body.name == "Player":
		Game.playerHP -=damage
		death()
		
func death():
	Game.gold += 5
	Utils.save_game()
	sprites.play("Death")
	chase = false
	await sprites.animation_finished
	self.queue_free()




func _on_player_collision_body_exited(body):
	pass # Replace with function body.
