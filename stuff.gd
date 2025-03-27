extends CharacterBody2D

@export var speed:int = 300
#var acceleration := 2

func _ready():
	position = Vector2(500,200)
	pass
	
func _process(delta):
	var dir = Input.get_vector("left","right","up","down")
	#print(dir)
	velocity = dir * speed
	#position += dir * speed * delta * acceleration
	move_and_slide()
	
		
