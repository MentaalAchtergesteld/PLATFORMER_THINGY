extends CharacterBody2D

@export var MOVE_SPEED: float = 300.0;
@export var STOP_SPEED: float = 200.0;
@export var JUMP_VELOCITY: float = -400.0;
@export var GRAVITY: float = 980.0;

func _input(event: InputEvent) -> void:
	$StateMachine.input(event);

func _ready() -> void:
	$StateMachine.init();

func _process(delta: float) -> void:
	$StateMachine.process(delta);

func _physics_process(delta: float) -> void:
	$StateMachine.physics_process(delta);
