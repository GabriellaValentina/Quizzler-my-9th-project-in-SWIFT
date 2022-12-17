//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//


import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var score: UILabel!
    var quizBrain = QuizBrain()
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUi()
        score.text = "Score: \(quizBrain.scoreQ)"
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
       print("\(userGotItRight)")
        
        
        if userGotItRight{
            sender.backgroundColor = UIColor.green
            quizBrain.score()
            
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.numberQuestion()
        score.text = "Score: \(quizBrain.scoreQ)"
        Timer.scheduledTimer(timeInterval: 0.3 , target: self, selector: #selector(updateUi), userInfo: nil, repeats: false)
        
        
        
        
        
    }
    
   @objc func updateUi(){
       
       questionLabel.text = quizBrain.textQuestion()
       
       progressBar.progress = quizBrain.progress()
       
       trueButton.backgroundColor = UIColor.clear
       falseButton.backgroundColor = UIColor.clear
   }
    
}
