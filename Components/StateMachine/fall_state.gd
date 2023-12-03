extends State
class_name FallState

@export var CHARACTER_BODY: CharacterBody2D;
@export var JUMP_STATS: JumpStats;
@export var MOVE_STATS: BasicHorizontalMovementStats;

@export var IDLE_STATE: State;
@export var WALK_STATE: State;
@export var RUN_STATE: State;
@export var JUMP_STATE: State;

var coyote_time = false;
var jump_buffer = false;

func enter(old_state: State) -> void:
	print("ENTERED FALL STATE");
	print(old_state);
	if old_state.is_ground_state():
		coyote_time = true;
		get_tree().create_timer(0.05).connect("timeout", on_coyote_time_timeout);

func exit():
	coyote_time = false;
	jump_buffer = false;

func input(event: InputEvent) -> State:
	
	if Input.is_action_just_pressed("jump"):
		if coyote_time:
			print("COYOTE TIME!");
			return JUMP_STATE;
		
		jump_buffer = true;
		get_tree().create_timer(0.05).connect("timeout", on_jump_buffer_timeout);
	
	return null;

func on_coyote_time_timeout():
	coyote_time = false;

func on_jump_buffer_timeout():
	jump_buffer = false;

func physics_process(delta: float) -> State:
	var move_direction = Input.get_axis("move_left", "move_right");
	
	CHARACTER_BODY.velocity.y += JUMP_STATS.fall_gravity * delta;
	CHARACTER_BODY.velocity.x = lerp(CHARACTER_BODY.velocity.x, move_direction * MOVE_STATS.MAX_SPEED * delta, JUMP_STATS.VELOCITY_CHANGE_SPEED * delta);
	CHARACTER_BODY.move_and_slide();
	
	if CHARACTER_BODY.is_on_floor():
		if jump_buffer:
			return JUMP_STATE;
		
		if move_direction == 0:
			return IDLE_STATE;
		
		if Input.is_action_pressed("run"):
			return RUN_STATE;
		else:
			return WALK_STATE;
	
	return null;
