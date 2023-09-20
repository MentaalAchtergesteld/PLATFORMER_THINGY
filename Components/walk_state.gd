extends MoveState

@export var RUN_STATE: State;

func input(event: InputEvent) -> State:
	var new_state = super.input(event);
	if new_state: return new_state;
	
	if Input.is_action_pressed("run"):
		return RUN_STATE;
	
	return null;
