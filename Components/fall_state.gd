extends State

@export var MOVE_SPEED: float = 2000;
@export var ACCELERATION: float = 1000;
@export var DECELERATION: float = 1000;
@export var GRAVITY: float = 50;
@export var CHARACTER_BODY: CharacterBody2D;

@export var IDLE_STATE: State;
@export var WALK_STATE: State;
@export var RUN_STATE: State;
@export var JUMP_STATE: State;

var jump_buffer = false;

func input(event: InputEvent) -> State:
	
	if Input.is_action_just_pressed("jump"):
		jump_buffer = true;
		get_tree().create_timer(0.1).connect("timeout", on_jump_buffer_timeout);
	
	return null;

func on_jump_buffer_timeout():
	jump_buffer = false;

func physics_process(delta: float) -> State:
	var move_direction = Input.get_axis("move_left", "move_right");
	
	if move_direction == 0:
		CHARACTER_BODY.velocity.x = move_toward(CHARACTER_BODY.velocity.x, 0, DECELERATION*delta);
	else:
		CHARACTER_BODY.velocity.x = move_toward(
			CHARACTER_BODY.velocity.x, 
			MOVE_SPEED*move_direction*delta, 
			ACCELERATION*delta);
	
	CHARACTER_BODY.velocity.y += GRAVITY;
	
	CHARACTER_BODY.move_and_slide();
	
	if CHARACTER_BODY.is_on_floor():
		if jump_buffer:
			return JUMP_STATE;
		
		if move_direction != 0:
			if Input.is_action_pressed("run"):
				return RUN_STATE;
			else:
				return WALK_STATE;
		else:
			return IDLE_STATE;
	
	return null;
