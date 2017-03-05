//
//  ViewController.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-02-27.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//  For Team Treehouse iOS Techdegree Project 2

import UIKit

class ViewController: UIViewController {
  
  //Interface Builder Outlets

  @IBOutlet var choiceButtons: [UIButton]!
  @IBOutlet weak var challengeInformation: UILabel!
  @IBOutlet weak var challengeType: UILabel!
  @IBOutlet weak var gameProgress: UILabel!
  @IBOutlet weak var gameInformation: UILabel!
  @IBOutlet weak var playAgainButton: UIButton!
  @IBOutlet weak var scoreInformation: UILabel!
  
  //Interface Builder Actions
  
  @IBAction func checkAnswer(_ sender: UIButton) {
    
    if sender.titleLabel?.text == quiz.answerText {
      displayCorrectMessage(isCorrect: true)
      quiz.numberCorrect += 1
      displayGameProgress()
    } else {
      displayCorrectMessage(isCorrect: false)
    }
    
    if quiz.currentChallengeIndex < quiz.challenges.count - 1 {
      quiz.currentChallengeIndex += 1
      loadNextRoundWithDelay(seconds: 2)
    } else {
      for button in choiceButtons {
        button.isHidden = true
      } 
      challengeInformation.text = ""
      challengeType.text = ""
      scoreInformation.text = quiz.quizScore()
      scoreInformation.isHidden = false
      gameInformation.isHidden = false
      playAgainButton.isHidden = false
    }
    
  }
  
  @IBAction func playAgain(_ sender: Any) {
    quiz = Quiz()
    displayQuizInformation()
  }
  
  // Create an instance of quiz and set the current index of
  // the collection of challenges to 0
  
  private var quiz = Quiz()

  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Start game
    displayQuizInformation()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func displayCorrectMessage(isCorrect: Bool) {
    for button in choiceButtons {
      button.isHidden = true
    }
    gameInformation.isHidden = false
    if(isCorrect) {
      gameInformation.text = "✅  That's correct!"
    } else {
      gameInformation.text = "❌  Sorry, the answer was \(quiz.answerText)"
    }
  }
  
  func displayQuizInformation() {
    gameInformation.isHidden = true
    playAgainButton.isHidden = true
    scoreInformation.isHidden = true
    displayQuestionInformation()
    displayChoices()
    displayGameProgress()
  }
  
  
  func displayQuestionInformation() {
    challengeInformation.text = quiz.questionText
    challengeType.text =  quiz.questionTypeText
  }
  
  func displayChoices() {
    var choiceIndex: Int = 0
    for button in choiceButtons {
      button.isHidden = false
      button.setTitle(quiz.answerTexts[choiceIndex], for: .normal)
      choiceIndex += 1
    }
    
    if quiz.choicesToDisplay == 3 {
      if quiz.answerText == quiz.answerTexts.first! {
        choiceButtons.last!.isHidden = true
      } else {
        choiceButtons.first!.isHidden = true
      }
    }
  }

  func displayGameProgress() {
    gameProgress.text = "Correct: \(quiz.numberCorrect)/\(quiz.numberOfQuestions)"
  }
  
  
  // MARK: Helper Methods
  
  func loadNextRoundWithDelay(seconds: Int) {
    // Converts a delay in seconds to nanoseconds as signed 64 bit integer
    let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
    // Calculates a time value to execute the method given current time and delay
    let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
    
    // Executes the nextRound method at the dispatch time on the main queue
    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
      self.displayQuizInformation()
    }
  }
}

