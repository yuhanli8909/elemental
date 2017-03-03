//
//  ViewController.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-02-27.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//  For Team Treehouse iOS Techdegree Project 2

import UIKit

class ViewController: UIViewController {

  @IBOutlet var choiceButtons: [UIButton]!
  @IBOutlet weak var challengeInformation: UILabel!
  @IBOutlet weak var challengeType: UILabel!
  @IBOutlet weak var gameProgress: UILabel!

  // Create an instance of quiz and set the current index of
  // the collection of challenges to 0

  let quiz = Quiz()
  let challengeIndex: Int = 0
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Start game
    displayQuizInformation()
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  func displayQuizInformation() {
    displayQuestionInformation()
    displayChoices()
    displayGameProgress()
  }
  
  func displayQuestionInformation() {
    challengeInformation.text = quiz.challenges[challengeIndex].questionText
    challengeType.text = quiz.challenges[challengeIndex].questionTypeText
  }
  
  func displayChoices() {
   // var choiceIndex: Int = 0
    let currentChallenge = quiz.challenges[challengeIndex]
  
    if quiz.challenge.answers.answerSet.count < choiceButtons.count {
      if choiceButtons[0].titleLabel?.text == currentChallenge.answerText {
        choiceButtons[1].isHidden = true
      } else {
        choiceButtons[0].isHidden = true
      }
    }
    
    for button in choiceButtons {
        button.titleLabel?.text = currentChallenge.answerText
    }
  }
  
  func displayGameProgress() {
    gameProgress.text = "Correct: \(quiz.numberCorrect)/\(quiz.numberOfQuestions)"
  }
}

