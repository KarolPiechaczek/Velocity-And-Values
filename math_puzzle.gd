extends Node2D

enum Difficulty {ADD, SUB, MUL, DIV, RANDOM}
@export var mode : Difficulty = Difficulty.RANDOM

var correct_answer : int
var correct_gate_index : int # 0 for Gate1, 1 for Gate2, 2 for Gate3

func _ready():
	generate_question()
	# Connect signals - tell gates to notify when the car enters them
	$Gate1.body_entered.connect(_on_gate_entered.bind(0))
	$Gate2.body_entered.connect(_on_gate_entered.bind(1))
	$Gate3.body_entered.connect(_on_gate_entered.bind(2))

func generate_question():
	var a = randi_range(1, 10)
	var b = randi_range(1, 10)
	var op_text = ""
	
	var current_op = mode
	if mode == Difficulty.RANDOM:
		current_op = (randi() % 4) as Difficulty
		
	match current_op:
		Difficulty.ADD:
			correct_answer = a + b
			op_text = str(a) + " + " + str(b)
		Difficulty.SUB:
			var big = max(a, b)
			var small = min(a, b)
			correct_answer = big - small
			op_text = str(big) + " - " + str(small)
		Difficulty.MUL:
			correct_answer = a * b
			op_text = str(a) + " x " + str(b)
		Difficulty.DIV:
			correct_answer = b
			op_text = str(a * b) + " : " + str(a)

	$Label.text = op_text + " = ?"
	
	correct_gate_index = randi() % 3
	var gates = [$Gate1, $Gate2, $Gate3]
	
	# NOWOŚĆ: Lista liczb użytych na bramkach (zaczynamy od wpisania poprawnego wyniku)
	var used_numbers = [correct_answer]
	
	for i in range(3):
		var gate_label = gates[i].get_node("Label")
		if i == correct_gate_index:
			gate_label.text = str(correct_answer)
		else:
			var fake = correct_answer
			
			# Pętla 'while' kręci się tak długo, dopóki wylosowana liczba znajduje się na liście 'used_numbers'
			while fake in used_numbers:
				fake = correct_answer + randi_range(-5, 5)
				
				# Dodatkowe zabezpieczenie: nie chcemy ujemnych fałszywek (żeby nie mylić przy mnożeniu/dzieleniu)
				if fake < 0:
					fake = correct_answer + randi_range(1, 8)
					
			# Dodajemy nową fałszywkę do listy użytych liczb, żeby kolejna bramka jej nie skopiowała
			used_numbers.append(fake)
			gate_label.text = str(fake)

# THIS FUNCTION EXECUTES ON COLLISION
func _on_gate_entered(body, gate_idx):
	# Check if the body that entered the gate is the player (Car)
	if body.name == "Car":
		if gate_idx == correct_gate_index:
			print("Correct answer!")
			# Optional: add points here
		else:
			print("Wrong! Game over.")
			# PAUSE THE GAME
			get_tree().paused = true
