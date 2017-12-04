
// Created on: Sep 2017
// Created by: James Lee
// Created for: ICS3U
// This program plays rock paper scissors with the computer
// this will be commented out when code moved to Xcode

import PlaygroundSupport

// Import the library needed for the UI
import UIKit

// Make sure there are no constants

class ViewController : UIViewController {
    // this is the main view controller, that will show the UIKit elements
    
    var userPick = ""
    var computerChoice = ""
    var computerPick = 0
    
    // properties
    var rockButton : UIButton!
    var paperButton : UIButton!
    var scissorsButton : UIButton!
    var answerLabel: UILabel!
    var questionLabel : UILabel!
    var computerChoiceLabel : UILabel!
    
    override func viewDidLoad() {
        // UI
        super.viewDidLoad()
        
        let view = UIView()
        
        // Make background white
        view.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.view = view
        
        // Code for button that shows rock, then paper, then scissors
        rockButton = UIButton()
        rockButton.setTitle("Rock", for: .normal)
        rockButton.setTitleColor(.blue, for: .normal)
        rockButton.addTarget(self, action: #selector(checkNumber), for: .touchUpInside)
        view.addSubview(rockButton)
        rockButton.translatesAutoresizingMaskIntoConstraints = false
        rockButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        rockButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        rockButton.tag = 1
        
        paperButton = UIButton()
        paperButton.setTitle("Paper", for: .normal)
        paperButton.setTitleColor(.blue, for: .normal)
        paperButton.addTarget(self, action: #selector(checkNumber), for: .touchUpInside)
        view.addSubview(paperButton)
        paperButton.translatesAutoresizingMaskIntoConstraints = false
        paperButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        paperButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 120).isActive = true
        paperButton.tag = 2
        
        scissorsButton = UIButton()
        scissorsButton.setTitle("Scissors", for: .normal)
        scissorsButton.setTitleColor(.blue, for: .normal)
        scissorsButton.addTarget(self, action: #selector(checkNumber), for: .touchUpInside)
        view.addSubview(scissorsButton)
        scissorsButton.translatesAutoresizingMaskIntoConstraints = false
        scissorsButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        scissorsButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 220).isActive = true
        scissorsButton.tag = 3
        
        // Code for the question asking user pick
        questionLabel = UILabel()
        questionLabel.text = "What do you pick?"
        view.addSubview(questionLabel)
        questionLabel.translatesAutoresizingMaskIntoConstraints = false
        questionLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        questionLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        //Shows computer's pick
        computerChoiceLabel = UILabel()
        computerChoiceLabel.text = "Computer picked..."
        view.addSubview(computerChoiceLabel)
        computerChoiceLabel.translatesAutoresizingMaskIntoConstraints = false
        computerChoiceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        computerChoiceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        // Code for the label that shows the output once entered an input
        answerLabel = UILabel()
        answerLabel.text = ""
        view.addSubview(answerLabel)
        answerLabel.translatesAutoresizingMaskIntoConstraints = false
        answerLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        answerLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
    }
    
    @objc func checkNumber(sender: UIButton!) {
        // Happens when the button is clicked, determines winner
        
        // Rnd number as computers pick
        computerPick = Int(arc4random_uniform(3))
        
        if computerPick == 0 {
            computerChoice = "Rock"
        }
            
        else if computerPick == 1 {
            computerChoice = "Paper"
        }
            
        else if computerPick == 2 {
            computerChoice = "Scissors"
        }
        
        // Shows the computer's pick
        computerChoiceLabel.text = "The computer picked " + String(describing: computerChoice)
        
        switch sender.tag {
            
        // If user picked rock
        case 1: userPick = "Rock"
        questionLabel.text = "You picked Rock"
        
        if computerChoice == "Scissors"{
            answerLabel.text = "You win!"
        }
        
        else if computerChoice == "Rock" {
            answerLabel.text = "It's a tie!"
        }
        
        else {
            answerLabel.text = "You lose!"
        }
            break
            
        // If user picked paper
        case 2: userPick = "Paper"
        
        questionLabel.text = "You picked Paper"
        
        if computerChoice == "Scissors"{
            answerLabel.text = "You lose!"
        }
            
        else if computerChoice == "Rock" {
            answerLabel.text = "You win!"
        }
            
        else {
            answerLabel.text = "It's a tie!"
        }
            break
            
            
        //If user picked scissors
        case 3 : userPick = "Scissors"
        
        questionLabel.text = "You picked Scissors"
        
        if computerChoice == "Scissors"{
            answerLabel.text = "It's a tie!"
        }
            
        else if computerChoice == "Rock" {
            answerLabel.text = "You lose!"
        }
            
        else {
            answerLabel.text = "You win!"
        }
            break
            
        //Else choose valid
        default: answerLabel.text = "Choose valid option"
}
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

// this will be commented out when code moved to Xcode
PlaygroundPage.current.liveView = ViewController()

