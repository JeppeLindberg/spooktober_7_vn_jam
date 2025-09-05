extends Control

@export var scenes: Node2D
@export var text_panel: Panel
@export var text: RichTextLabel
@export var speaker_text: RichTextLabel
@export var base_symbols_per_sec = 30.0

var dialog_step = -1
var dialog_array = []
var symbols_per_sec = 0.0
var time_progress = 0.0
var ready_for_next_text = false
var recursion_block = false
var current_scene = ''


	

func is_in_dialog():
	return dialog_array != []

func start_scene(new_scene):
	var scene_node = scenes.get_node(new_scene)
	dialog_step = -1
	dialog_array = scene_node.dialog_array
	current_scene = new_scene
	next_dialog_step()

func _process(delta: float) -> void:
	recursion_block = false
	_update(delta)

func _update(delta):
	text_panel.visible = is_in_dialog()
	time_progress += delta * symbols_per_sec
	if is_in_dialog():
		speaker_text.text = raw_to_bb(_current_dialog_step()['speaker'])
		text.text = raw_to_bb(_current_dialog_step()['text'], int(time_progress))
		scenes.swap_scene(current_scene, _current_dialog_step()['subscene'])
	
		if Input.is_action_just_pressed("interact") and (not recursion_block):
			recursion_block = true
			if ready_for_next_text:
				next_dialog_step()
			elif time_progress > 1.0:
				time_progress += 1000.0
	
func next_dialog_step():
	dialog_step += 1
	print(dialog_step)
	
	time_progress = 0.0
	symbols_per_sec = base_symbols_per_sec
	ready_for_next_text = false

	if dialog_step >= len(dialog_array):
		dialog_step = -1
		dialog_array = []

	_update(0.0)
	

func raw_to_bb(raw, symbols = 10000):
	var output = ''
	var i = 0
	while i < len(raw):
		if raw[i] == ' ':
			output += ' '
			i += 1
			symbols += 1

		if i > symbols:
			output += '[color=#FFFFFF00]' + raw[i]
		else:
			output += '[color=#FFFFFFFF]' + raw[i]
		i += 1

	if symbols >= len(raw):
		ready_for_next_text = true
	
	return output
	
func _current_dialog_step():
	var defaults = \
	{
		'speaker': '',
		'text': '',
		'sound': '',
		'subscene': '',
	}

	var current_step = defaults
	if dialog_array[dialog_step].get('speaker') != null:
		current_step['speaker'] = dialog_array[dialog_step]['speaker']
	if dialog_array[dialog_step].get('text') != null:
		current_step['text'] = dialog_array[dialog_step]['text']
	if dialog_array[dialog_step].get('sound') != null:
		current_step['sound'] = dialog_array[dialog_step]['sound']
	if dialog_array[dialog_step].get('subscene') != null:
		current_step['subscene'] = dialog_array[dialog_step]['subscene']

	return current_step;
