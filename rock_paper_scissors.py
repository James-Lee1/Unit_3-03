# coding: utf-8

import ui
import random

box = ['Rock', 'Paper', 'Scissors']
global user_picked

def rock_paper_scissors_touch_up_inside(sender):
	
	if sender.name == "rock_button":
	
		user_picked = 'Rock'
		view['user_pick_label'].text = 'You picked Rock'
	
	elif sender.name == "paper_button":
		user_picked = 'Paper'
		view['user_pick_label'].text = 'You picked paper'
		
	elif sender.name == "scissors_button":
		user_picked = 'Scissors'
		view['user_pick_label'].text = 'You picked scissors'
	
	random_number = random.randint(0, 2)

	view['computer_answer'].text = 'The computer picked ' + str(box[random_number])
	
	if user_picked == 'Rock' and box[random_number] == 'Scissors' or user_picked == 'Paper' and box[random_number] == 'Rock' or user_picked == 'Scissors' and box[random_number] == 'Paper':
		
		view['answer_label'].text = "You win this round!" 
	
	elif user_picked == box[random_number]:
		
		view['answer_label'].text = "Its a tie!"
		
	else:
		
		view['answer_label'].text = "You lost this round!"
		
view = ui.load_view()
view.present('full_screen')
