extends Node2D

var current_scene = ''
var current_subscene = ''

@export var layer_1: SubViewport
@export_flags_2d_render var layer_1_bits: int


func swap_scene(new_scene, new_subscene):
	if (new_scene == '') or (new_subscene == ''):
		return

	if new_scene != current_scene:
		current_scene = new_scene

		for child in layer_1.get_children():
			if not child is Camera2D:
				child.queue_free()

	var scene_node = get_node(current_scene)

	if new_subscene != current_subscene:
		current_subscene = new_subscene

		var subscene_node = scene_node.get_node(current_subscene)

		var subscene_layer_1 = subscene_node.duplicate()
		layer_1.add_child(subscene_layer_1)
		subscene_layer_1.position = Vector2.ZERO
		for child in subscene_layer_1.get_children():
			if child.has_meta('target_layer') and not (child.target_layer & layer_1_bits):
				child.queue_free()
			if child.get('simulate') != null:
				child.simulate = true



		
