extends State

@export var CHARACTER_BODY: CharacterBody2D;

@export var WALK_STATE: State;
@export var RUN_STATE: State;
@export var JUMP_STATE: State;
@export var FALL_STATE: State;

func enter() -> void:
	CHARACTER_BODY.velocity.x = 0;

func input(event: InputEvent) -> State:
	if Input.get_axis("move_left", "move_right") != 0:
		if Input.is_action_pressed("run"):
			return RUN_STATE;
		else:
			return WALK_STATE;
	
	if Input.is_action_just_pressed("jump"):
		return JUMP_STATE;
	
	return null;

func physics_process(delta: float) -> State:
	if !CHARACTER_BODY.is_on_floor():
		return FALL_STATE;
	
	return null;
