extends Node3D
class_name PlayerShoot

@export var damage = 20
var canshoot: bool = true
@onready var raycast = $"../RayCast3D"
@onready var firerate = $RayCastGun/Firerate

# Preloads
@onready var BulletDecal = preload("res://Scene/Gun/bullet_decal.tscn")
@onready var TerrainPart = preload("res://Scene/Gun/terrain_part.tscn")
@onready var EnemyPart = preload("res://Scene/Gun/enemy_part.tscn")

# Crosshair Settings
@onready var RIGHT = $Crosshair/Center/Line2D2
@onready var LEFT = $Crosshair/Center/Line2D4
@onready var TOP = $Crosshair/Center/Line2D5
@onready var BOTTOM = $Crosshair/Center/Line2D3
var GROWPOS = 35
var GROWSPEED = 4

# Spread Settings
var spread = 0.15
var finalPosition: Vector3
var maxRecoil = 1
var returnSpeed = 4

# Sound
@onready var sound = $"RayCastGun/RayCastGun-Sound"

func _physics_process(delta: float) -> void:
	finalPosition = lerp(finalPosition, Vector3.ZERO, returnSpeed * delta)
	animate_recoil(delta)
	crosshair(delta) 

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("shoot") && canshoot:
		canshoot = false
		firerate.start()
		shoot()

func shoot() -> void:
	sound.play()
	apply_spread()
	if raycast.is_colliding():
		var colpoint = raycast.get_collision_point()
		var normal = raycast.get_collision_normal()
		var target = raycast.get_collider()
		
		if target != null:
			if target.is_in_group("Enemy"):
					damage_target(target)
					add_terraineffect(EnemyPart, colpoint, normal)
			else:
				add_terraineffect(TerrainPart, colpoint, normal)
				add_bulletdecal(colpoint, normal)

func damage_target(target):
	if target.get_node("HitComponent"):
		var hitbox = target.get_node("HitComponent")
		hitbox.damage(damage)

func add_terraineffect(effectType, colpoint, normal) -> void:
	var effect = effectType.instantiate()
	effect.global_position = colpoint
	get_tree().current_scene.add_child(effect)
	effect.look_at(colpoint + normal, Vector3.UP)
	effect.look_at(colpoint + normal, Vector3.RIGHT)

func add_bulletdecal(colpoint, normal) -> void:
	var bulletdecal = BulletDecal.instantiate()
	bulletdecal.global_position = colpoint
	get_tree().current_scene.add_child(bulletdecal)
	bulletdecal.look_at(colpoint + normal, Vector3.UP)
	bulletdecal.look_at(colpoint + normal, Vector3.RIGHT)

func _on_firerate_timeout() -> void:
	canshoot = true

func animate_recoil(delta: float):
	if !canshoot:
		self.position = lerp(self.position, Vector3(randf_range(-0.3, 0.3),randf_range(-0.3, 0.3),randf_range(0.5, 1)), delta * 10)
	else:
		self.position = lerp(self.position, Vector3.ZERO, delta * 5)

func apply_spread():
	var randomSpread = Vector3(randf_range(-spread, spread), randf_range(-spread, spread), 0)
	raycast.position = randomSpread
	finalPosition.x += maxRecoil

func crosshair(delta):
	if !canshoot:
		RIGHT.position = lerp(RIGHT.position, Vector2(GROWPOS,0), GROWSPEED * delta)
		LEFT.position = lerp(LEFT.position, Vector2(-GROWPOS,0), GROWSPEED * delta)
		BOTTOM.position = lerp(BOTTOM.position, Vector2(0,GROWPOS), GROWSPEED * delta)
		TOP.position = lerp(TOP.position, Vector2(0,-GROWPOS), GROWSPEED * delta)
	else:
		RIGHT.position = lerp(RIGHT.position, Vector2(10,0), GROWSPEED * delta)
		LEFT.position = lerp(LEFT.position, Vector2(-10,0), GROWSPEED * delta)
		BOTTOM.position = lerp(BOTTOM.position, Vector2(0,10), GROWSPEED * delta)
		TOP.position = lerp(TOP.position, Vector2(0,-10), GROWSPEED * delta)
