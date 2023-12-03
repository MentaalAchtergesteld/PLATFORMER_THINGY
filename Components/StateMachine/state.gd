extends Node
class_name State

func is_ground_state() -> bool:
	return false;

func enter(old_state: State) -> void:
	return;

func exit() -> void:
	return;

func input(event: InputEvent) -> State:
	return;

func process(delta: float) -> State:
	return;

func physics_process(delta: float) -> State:
	return;
