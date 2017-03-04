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
  
  //Interface Builder Actions
  
  @IBAction func checkAnswer(_ sender: UIButton) {
    
    if sender.titleLabel?.text == quiz.challenges[challengeIndex].answerText {
      displayCorrectMessage(isCorrect: true)
      quiz.numberCorrect += 1
      displayGameProgress()
    } else {
      displayCorrectMessage(isCorrect: false)
    }
    if challengeIndex < quiz.challenges.count - 1 {
      challengeIndex += 1
    }
    loadNextRoundWithDelay(seconds: 2)
  }
  
  // Create an instance of quiz and set the current index of
  // the collection of challenges to 0
  
  private var quiz = Quiz()
  private var challengeIndex: Int = 0

  
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
      gameInformation.text = "✅ That's correct!"
    } else {
      gameInformation.text = "❌ Sorry, the answer was \(quiz.challenges[challengeIndex].answerText)"
    }
  }
  
  func displayQuizInformation() {
    for button in choiceButtons {
      button.isHidden = false
    }
    gameInformation.isHidden = true
    playAgainButton.isHidden = true
    displayQuestionInformation()
    displayChoices()
    displayGameProgress()
  }
  
  func displayQuestionInformation() {
    challengeInformation.text = quiz.challenges[challengeIndex].questionText
    challengeType.text = quiz.challenges[challengeIndex].questionTypeText
  }
  
  func displayChoices() {
    var choiceIndex: Int = 0
    let currentChallenge = quiz.challenges[challengeIndex]
    for button in choiceButtons {
      button.setTitle(currentChallenge.answerTexts[choiceIndex], for: .normal)
      choiceIndex += 1
    }
    
    
    // Logic to display only 3 possible choices instead of 4
    
    if quiz.challenges[challengeIndex].choicesToDisplay == 3 {
      if choiceButtons.first!.titleLabel?.text == quiz.challenges[challengeIndex].answerText {
        choiceButtons[1].isHidden = true
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

