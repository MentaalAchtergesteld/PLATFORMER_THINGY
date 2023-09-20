extends Node
class_name StateMachine

@export var default_state: State;

var current_state: State;

func change_state(new_state: State) -> void:
	current_state.exit();
	current_state = new_state;
	new_state.enter();

func init():
	current_state = default_state;
	current_state.enter();

func input(event: InputEvent):
	var new_state = current_state.input(event);
	if new_state != null: change_state(new_state);

func process(delta: float):
	var new_state = current_state.process(delta);
	if new_state != null: change_state(new_state);

func physics_process(delta: float):
	var new_state = current_state.physics_process(delta);
	if new_state != null: change_state(new_state);
