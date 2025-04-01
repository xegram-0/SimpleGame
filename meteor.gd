extends Area2D

var speed:int
var rotation_speed:int
var direction:float

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	
	#var path:String = "res://space/meteor_" + str(rng.randi_range(1,2)) + ".png"  # String not string
	#$TheMeteor.texture = load(path)
	
	var rng:=RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0,width)
	var random_y = rng.randi_range(-150,-50)
	
	position = Vector2(random_x, random_y)
	speed = rng.randi_range(200, 500) # Adding var would result in local var
	direction = rng.randf_range(-1,1)
	rotation_speed = rng.randi_range(40, 100)
	
	# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) :
	position += Vector2(direction, 1.0) * delta * speed
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
	print("Ship has entered!")
	
