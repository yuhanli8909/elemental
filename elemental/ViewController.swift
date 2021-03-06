//
//  ViewController.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-02-27.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//  For Team Treehouse iOS Techdegree Project 2

import UIKit

class ViewController: UIViewController {
  
  
  private var quiz = Quiz()
  private var seconds = 15
  private var timer = Timer()
  
  
  //Interface Builder Outlets

  @IBOutlet var choiceButtons: [UIButton]!
  @IBOutlet weak var challengeInformation: UILabel!
  @IBOutlet weak var challengeType: UILabel!
  @IBOutlet weak var gameProgress: UILabel!
  @IBOutlet weak var gameInformation: UILabel!
  @IBOutlet weak var playAgainButton: UIButton!
  @IBOutlet weak var scoreInformation: UILabel!
  @IBOutlet weak var timerLabel: UILabel!
  
  
  //Interface Builder Actions
  
  @IBAction func checkAnswer(_ sender: UIButton) -> Void {
    timer.invalidate()
    timerLabel.text = ""
    
    if sender.titleLabel?.text == quiz.answerText {
      displayCorrectMessage(isCorrect: true)
      quiz.numberCorrect += 1
    } else {
      displayCorrectMessage(isCorrect: false)
    }
    displayGameProgress()
    checkGameEnd()
  }
  
  @IBAction func playAgain(_ sender: Any) -> Void {
    quiz = Quiz()
    seconds = 15
    timer = Timer()
    resetTimer()
    displayQuizInformation()
  }
  
  
  override func viewDidLoad() -> Void {
    super.viewDidLoad()
    // Start game
    resetTimer()
    displayQuizInformation()
  }

  override func didReceiveMemoryWarning() -> Void {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  
  func checkGameEnd() -> Void {
    if quiz.currentChallengeIndex < quiz.challenges.count - 1 {
      quiz.currentChallengeIndex += 1
      loadNextRoundWithDelay(seconds: 2)
    } else {
      for button in choiceButtons {
        button.isHidden = true
      }
      scoreInformation.text = quiz.quizScore()
      scoreInformation.isHidden = false
      gameInformation.isHidden = false
      playAgainButton.isHidden = false
    }
  }
  
  func resetTimer() -> Void {
    timer.invalidate()
    seconds = 15
    
    let dispatchTime = DispatchTime.now()
    
    // Executes the nextRound method at the dispatch time on the main queue
    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
      self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.countTime), userInfo: nil, repeats: true)
    }
  }
  
  
  func countTime() -> Void {
    seconds -= 1
    timerLabel.text = String(seconds)
    
    if seconds == 0 {
      timer.invalidate()
      displayCorrectMessage(isCorrect: false)
      checkGameEnd()
    }
  }
  
  
  // Display if the answer was correct or not
  
  func displayCorrectMessage(isCorrect: Bool) -> Void {
    for button in choiceButtons {
      button.isHidden = true
    }
    gameInformation.isHidden = false
    if(isCorrect) {
      gameInformation.text = "✅ That's correct!"
    } else {
      gameInformation.text = "❌ Bummer! \nThe correct answer was \(quiz.answerText)"
    }
  }
  
  
  // Display all important information about the Quiz
  
  func displayQuizInformation() -> Void {
    //resetTimer()
    gameInformation.isHidden = true
    playAgainButton.isHidden = true
    scoreInformation.isHidden = true
    displayQuestionInformation()
    displayChoices()
    displayGameProgress()
  }
  
  
  // Display the question and the type of question 
  
  func displayQuestionInformation() -> Void {
    challengeInformation.text = quiz.questionText
    challengeType.text =  quiz.questionTypeText
  }
  
  
  // Display the choice to pick from including a guaranteed correct answer
  
  func displayChoices() -> Void {
    var choiceIndex: Int = 0
    for button in choiceButtons {
      button.isHidden = false
      button.setTitle(quiz.answerTexts[choiceIndex], for: .normal)
      choiceIndex += 1
    }
    
    
    // Logic to show 3 choices instead of the customary 4 to meet the exceeds expectations criteria
    
    // If the number of choices to display is 3.  I could have not used a "magic number" here, but felt
    // it was appropriate for clarity
    
    if quiz.choicesToDisplay == 3 {
      // If the first text assigned to the button was equal to the correct answer
      // hide the last button, otherwise hide the first button
      
      if quiz.answerText == quiz.answerTexts.first! {
        choiceButtons.last!.isHidden = true
      } else {
        choiceButtons.first!.isHidden = true
      }
    }
  }

  
  // Display how many correct out of the total number of questions available
  
  func displayGameProgress() -> Void {
    gameProgress.text = "Correct: \(quiz.numberCorrect)/\(quiz.numberOfQuestions)"
  }
  
  
  // MARK: Helper Methods
  
  func loadNextRoundWithDelay(seconds: Int) -> Void {
    // Converts a delay in seconds to nanoseconds as signed 64 bit integer
    let delay = Int64(NSEC_PER_SEC * UInt64(seconds))
    // Calculates a time value to execute the method given current time and delay
    let dispatchTime = DispatchTime.now() + Double(delay) / Double(NSEC_PER_SEC)
    
    // Executes the nextRound method at the dispatch time on the main queue
    DispatchQueue.main.asyncAfter(deadline: dispatchTime) {
      self.displayQuizInformation()
      self.resetTimer()
    }
  }
}

