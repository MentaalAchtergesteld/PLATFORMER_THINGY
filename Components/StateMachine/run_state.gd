extends MoveState
class_name RunState

@export var RUN_STATS: BasicHorizontalMovementStats;
@export var WALK_STATE: State;

func is_ground_state() -> bool:
	return true;

func input(event: InputEvent) -> State:
	var new_state = super.input(event);
	if new_state: return new_state;
	
	if !Input.is_action_pressed("run"):
		return WALK_STATE;
	
	return null;
