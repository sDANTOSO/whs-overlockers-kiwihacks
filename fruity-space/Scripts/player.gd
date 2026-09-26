extends CharacterBody2D


@export var GROUNDSPEED:float = 100
@export var AIRSPEED:float = 5
@export var MAXAIRSPEED: float = 15;
@export var FRICTION: float = 0.8;
@export var G: float = 15;
@export var jump_velocity: int = 700
@export var jumpThreshold: float = 0.3;

@onready var shapecast = $ShapeCast2D
@export var hud: Control;
@export var planet: Node2D;
@export var max_health: int = 10;
var health: int = max_health
@export var damage_cooldown: int = 10
@export var checkpoint_position: Vector2

@onready var arrow: Sprite2D = $ArrowSprite;
@onready var sprite: Sprite2D = $Sprite2D;
@export var idleSprite : Texture;
@export var jumpSprite : Texture;


var frames_since_last_damaged = 100;

var grounded: bool = false;

func _ready() -> void:
	goto_checkpoint()
	hud.display_health(health)

func goto_checkpoint():
	pass

func _physics_process(delta: float) -> void:
	look_at(planet.position)
	rotate(deg_to_rad(-90));
	
	var mousePos = get_global_mouse_position();
	arrow.look_at(mousePos)

	var direction := Input.get_axis("ui_left", "ui_right")
	if direction > 0:
		sprite.flip_h = false;
	elif direction < 0:
		sprite.flip_h = true;

	var diffToPlanet: Vector2 = (planet.position - position).normalized();
	if not shapecast.is_colliding():
		sprite.texture = jumpSprite;
		grounded = false;
	else:
		grounded = true;
		sprite.texture = idleSprite;
		if Input.is_action_just_pressed("ui_accept"):
			velocity-=diffToPlanet*jump_velocity;
	
	var rightward = transform.x;
	var horizontalVelocity = direction*rightward;
	
	
	if !grounded:
		velocity += diffToPlanet * G;
		if velocity.length()<MAXAIRSPEED:
			velocity+=horizontalVelocity*AIRSPEED;
	else:
		velocity+=horizontalVelocity*GROUNDSPEED;
		velocity *= FRICTION

	move_and_slide();
	frames_since_last_damaged += 1

	if Input.is_action_pressed("checkpoint"):
		goto_checkpoint()

func handle_damage():
	if frames_since_last_damaged >= damage_cooldown:
		health -= 1
		frames_since_last_damaged = 0
		#print(health)
		hud.display_health(health)
	if health <= 0:
		goto_checkpoint()
		health = max_health
		
func handle_checkpoint(pos: Vector2):
	checkpoint_position = Vector2 (
	 	atan2(pos.y, pos.x),
		Vector2(pos.x, pos.y).length()
	)
	
