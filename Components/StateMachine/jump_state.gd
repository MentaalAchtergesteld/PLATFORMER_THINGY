extends State
class_name JumpState

@export var CHARACTER_BODY: CharacterBody2D;
@export var JUMP_STATS: JumpStats;
@export var MOVE_STATS: BasicHorizontalMovementStats;

@export var IDLE_STATE: State;
@export var FALL_STATE: State;
@export var WALK_STATE: State;
@export var RUN_STATE: State;

func enter(old_state: State) -> void:
	CHARACTER_BODY.velocity.y = JUMP_STATS.jump_velocity;

func physics_process(delta: float) -> State:
	var move_direction = Input.get_axis("move_left", "move_right");
	
	CHARACTER_BODY.velocity.y += JUMP_STATS.jump_gravity * delta;
	CHARACTER_BODY.velocity.x = lerp(CHARACTER_BODY.velocity.x, move_direction * MOVE_STATS.MAX_SPEED, JUMP_STATS.VELOCITY_CHANGE_SPEED * delta);
	
	CHARACTER_BODY.move_and_slide();
	
	if CHARACTER_BODY.velocity.y > 0:
		return FALL_STATE;

	if CHARACTER_BODY.is_on_floor():
		if move_direction == 0:
			return IDLE_STATE;
		
		if Input.is_action_pressed("run"):
			return RUN_STATE;
		else:
			return WALK_STATE;
	
	return null;
