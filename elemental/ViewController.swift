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
  
  let quiz = Quiz(timer: false, questions: 5)
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
    var choiceIndex: Int = 0
    let currentChallenge = quiz.challenges[challengeIndex]
  
    for button in choiceButtons {
      button.setTitle(currentChallenge.choiceTexts[choiceIndex], for: .normal)
      choiceIndex += 1
    }
  }
  
  func displayGameProgress() {
    gameProgress.text = "Correct: \(quiz.numberCorrect)/\(quiz.numberOfQuestions)"
  }
}

