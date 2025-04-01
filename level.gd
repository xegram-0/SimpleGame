extends Node2D

# Load scene
var meteor_scence:PackedScene = load("res://meteor.tscn") 
var lazer_scene:PackedScene = load("res://lazer.tscn")

func _on_metetor_timer_timeout() -> void:
	var meteor = meteor_scence.instantiate() #create an instance
	# attach to the scene tree
	$Meteors.add_child(meteor) # add the stuff to the level
	
func _on_space_ship_lazer(pos):
	var lazer = lazer_scene.instantiate()
	$Lazer.add_child(lazer)
	lazer.position = pos
