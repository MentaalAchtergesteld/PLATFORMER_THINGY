extends State
class_name MoveState

@export var MOVE_SPEED: float = 4000;
@export var ACCELERATION: float = 1000;
@export var DECELERATION: float = 1000;
@export var CHARACTER_BODY: CharacterBody2D;

@export var JUMP_STATE: State;
@export var FALL_STATE: State;
@export var IDLE_STATE: State;

func get_movement_direction() -> int:
	return Input.get_axis("move_left", "move_right");

func input(event: InputEvent) -> State:
	if Input.is_action_just_pressed("jump"):
		return JUMP_STATE;
	
	return null;

func physics_process(delta: float) -> State:
	if !CHARACTER_BODY.is_on_floor():
		return FALL_STATE;
	
	var move_direction = get_movement_direction();
	
	if move_direction == 0:
		CHARACTER_BODY.velocity.x = move_toward(CHARACTER_BODY.velocity.x, 0, DECELERATION*delta);
	else:
		CHARACTER_BODY.velocity.x = move_toward(
			CHARACTER_BODY.velocity.x, 
			MOVE_SPEED*move_direction*delta, 
			ACCELERATION*delta);
	
	
	CHARACTER_BODY.move_and_slide();
	
	if CHARACTER_BODY.velocity.x == 0:
		return IDLE_STATE;
	
	return null;
