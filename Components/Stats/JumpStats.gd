extends Node
class_name JumpStats

@export var JUMP_HEIGHT: float;
@export var JUMP_TIME_TO_PEAK: float;
@export var JUMP_TIME_TO_DESCENT: float;
@export var VELOCITY_CHANGE_SPEED: float;

@onready var jump_velocity: float = ((2.0 * JUMP_HEIGHT) / JUMP_TIME_TO_PEAK) * -1;
@onready var jump_gravity: float = ((-2.0 * JUMP_HEIGHT) / (JUMP_TIME_TO_PEAK * JUMP_TIME_TO_PEAK)) * -1;
@onready var fall_gravity: float = ((-2.0 * JUMP_HEIGHT) / (JUMP_TIME_TO_PEAK * JUMP_TIME_TO_DESCENT)) * -1;
