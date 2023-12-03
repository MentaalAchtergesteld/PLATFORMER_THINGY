extends MoveState
class_name WalkState

@export var RUN_STATE: State;

func is_ground_state() -> bool:
	return true;

func input(event: InputEvent) -> State:
	var new_state = super.input(event);
	if new_state: return new_state;
	
	if Input.is_action_pressed("run"):
		return RUN_STATE;
	
	return null;
