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
  }
  
  func displayQuestionInformation() {
    challengeInformation.text = quiz.challenges[challengeIndex].questionText
    challengeType.text = quiz.challenges[challengeIndex].questionTypeText
  }
  
  func displayChoices() {
    for button in choiceButtons {
      button.setTitle(quiz.challenges[challengeIndex].answerText, for: .normal)
    }
  }
}

