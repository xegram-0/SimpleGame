extends CharacterBody2D

# @export enables direct settings in Inspector mode
@export var speed:int = 500
@export var can_shoot:bool

signal lazer(pos) # Custom signal for the lazer

func _ready():
	position = Vector2(600,500) # The ship starting position

func _process(_delta):      # _delta would prevent the debugger from reporting unused var
	var dir = Input.get_vector("left","right","up","down")
	velocity = dir * speed # position += dir * speed * delta * acceleration
	move_and_slide()
	
	# pressed vs just pressed
	# True forever vs True for each press
	
	if Input.is_action_just_pressed("shoot") and can_shoot:
		
		# global_position takes what you have in mind
		# while position would be relative to the ship marker in 2D settings
		# We want the lazer to be shot from the front of the ship
		
		lazer.emit($LazerPos.global_position)
		can_shoot = false
		$LazerCD.start()

func _on_lazer_cd_timeout() -> void:
	can_shoot = true
	
