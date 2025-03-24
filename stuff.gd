extends Node2D

@export var speed:int = 250
var acceleration := 2

func _ready():
	#position = Vector2(200,200)
	pass
	
func _process(delta):
	var dir = Input.get_vector("left","right","up","down")
	print(dir)
	position += dir * speed * delta * acceleration
	
		
