extends MoveState

@export var WALK_STATE: State;

func input(event: InputEvent) -> State:
	var new_state = super.input(event);
	if new_state: return new_state;
	
	if !Input.is_action_pressed("run"):
		return WALK_STATE;
	
	return null;
