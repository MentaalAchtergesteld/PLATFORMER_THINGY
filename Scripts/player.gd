extends CharacterBody2D

func _input(event: InputEvent) -> void:
	$StateMachine.input(event);

func _ready() -> void:
	$StateMachine.init();

func _process(delta: float) -> void:
	$StateMachine.process(delta);

func _physics_process(delta: float) -> void:
	$StateMachine.physics_process(delta);
