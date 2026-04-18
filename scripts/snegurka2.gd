extends CharacterBody2D

const SPEED = 300.0
@export var JUMP_VELOCITY = -400.0

@onready var Sprite = $AnimatedSprite2D
var tilemap: TileMap

@onready var hold: float = 0.0

var dead = false

@onready var sizzle_sound = $sizzle
var can_sizzle = true

@onready var ded = $death
var can_ded = true

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	tilemap = get_parent().get_node("Tiles")
	can_ded = true


func _physics_process(delta):
	hold += delta
	
	if Global.health <= 0: 
		dead = true
	
	is_in_light()
	
	match dead:
		true: 
			sizzle_sound.stop()
			can_sizzle = true
			
			if can_ded:
				ded.play()
				can_ded = false
			
			if Sprite.animation != "death":
				Sprite.play("death")
		
		false: 
			match is_in_light():
				true: 
					if can_sizzle:
						can_sizzle = false
						sizzle_sound.play()
						await sizzle_sound.finished
						can_sizzle = true
					
					if Sprite.animation != "hurt":
						Sprite.play("hurt")
					
					if hold >= 0.3: 
						Global.health -= 1
						hold = 0.0
				
				false: 
					if sizzle_sound.playing:
						sizzle_sound.stop()
						can_sizzle = true
					
					if Sprite.animation != "idle":
						Sprite.play("idle")
					
					if hold >= 1.0:
						Global.health -= 1
						hold = 0.0
			
			
			if Input.is_action_just_pressed("ui_accept") and is_on_floor():
				velocity.y = JUMP_VELOCITY
			
			var direction = Input.get_axis("ui_left", "ui_right")
			if direction:
				velocity.x = direction * SPEED * Global.speed
			else:
				velocity.x = move_toward(velocity.x, 0, SPEED * Global.speed)
			
			move_and_slide()
	
	if not is_on_floor():
		velocity.y += gravity * delta


func is_in_light() -> bool:
	var cell_pos = tilemap.local_to_map(global_position)
	var source_id = tilemap.get_cell_source_id(0, Vector2i(cell_pos.x, cell_pos.y))
	if source_id == 1: 
		return true
	return false

