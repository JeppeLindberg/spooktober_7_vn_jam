extends Node2D

@export var textbox: Control


var dialog_array = \
[
	{
		'text': '',
		'subscene': 'library_1_1'
	},
	{
		'speaker': '',
		'text': '......',
		'sound': 'radio_static',
	},
	{
		'speaker': '',
		'text': '......',
		'sound': 'radio_static',
	},
	{
		'speaker': '',
		'text': '...-',
		'sound': 'radio_static_tune_out',
	},
	{
		'speaker': 'Radio:',
		'text': '... so, with just 5 easy payments of 5.99, you too can know your future! Contact the Occult Emporium now!',
	},
	{
		'speaker': 'Sam (thinking):',
		'text': 'Ugh, the radio is nothing but ads nowadays...',
	},
	{
		'speaker': 'Sam (thinking):',
		'text': 'But i have to have something to pass the time.',
	},
	{
		'speaker': 'Sam (thinking):',
		'text': 'This job is so boring.',
	},
	{
		'speaker': 'Sam (thinking):',
		'text': 'Just guarding books all day, as if they are going to sprout wings and fly away.',
	},
	{
		'speaker': 'James (radio):',
		'text': 'Now, back to our regularly scheduled talk with Malefic Black, our expert of supernatural phenomenons!',
	},
	{
		'speaker': 'Black (radio):',
		'text': 'Thank you James, and by the way, it is called <wave>phenomena.<normal>',
	},
	{
		'speaker': 'James (radio):',
		'text': 'Thats why you are the expert! Now tell me, what did you want to talk about today?',
	},
	{
		'speaker': 'Black (radio):',
		'text': 'James, as we all know, today marks the third anniversary of the common discovery of the occult.',
	},
	{
		'speaker': 'Black (radio):',
		'text': 'Since that day, life has not been the same for any of us.',
	},
	{
		'speaker': 'James (radio):',
		'text': 'You don’t need to tell me twice! The other day some woman was practicing her magic in the coffee shop downtown.',
	},
	{
		'speaker': 'James (radio):',
		'text': 'Scorched my eyebrows clean off!',
	},
	{
		'speaker': 'Black (radio):',
		'text': 'Right, well now most of the strange happenstance that we experience is harmless.',
	},
	{
		'speaker': 'Black (radio):',
		'text': 'However...',
	},
	{
		'speaker': 'Black (radio):',
		'text': 'Some of the creatures that appear now in the open are not that friendly.',
	},
	{
		'text': '',
		'subscene': 'library_1_2'
	},
	{
		'speaker': 'Moth?',
		'text': 'erm... excuse me...',
	},
	{
		'speaker': 'Moth?',
		'text': 'coming through...',
	},
	{
		'speaker': 'Black (radio):',
		'text': 'They are deft and cunning, able to hide in plain sight.',
	},
	{
		'speaker': 'Black (radio):',
		'text': 'Even among people.',
	},
	{
		'speaker': 'Moth?',
		'text': 'ermm... hi',
	},
	{
		'text': '',
		'subscene': 'library_1_3' #Bystanders scurry away
	},
	{
		'speaker': 'Black (radio):',
		'text': 'They take advantage of every weakness of humans.',
	},
	{
		'text': '',
		'subscene': 'library_1_4' #Moth starts looking through some books
	},
	{
		'speaker': 'Black (radio):',
		'text': 'They possess incredible strength and dexterity.',
	},
	{
		'text': '',
		'subscene': 'library_1_5' #Moth picks out a book, but hit their arm on a shelf, knocking out some books
	},
	{
		'speaker': 'Moth?',
		'text': 'oh... ermmm... oops',
	},
	{
		'text': '',
		'subscene': 'library_1_6' #Moth stumbles and knocks a big row of books off the shelf
	},
	{
		'speaker': 'Moth?',
		'text': 'uhhhh... oh no… erm sorry',
	},
	{
		'text': '',
		'subscene': 'moth_libary_6' #Moth runs off
	},
	{
		'speaker': 'Sam (thinking):',
		'text': '... What was that about?',
	},
]


func _ready() -> void:
	textbox.start_scene('library_1')
	
		
