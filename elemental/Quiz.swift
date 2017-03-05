//
//  Quiz.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-03-02.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

struct Quiz {
  private var timerOn: Bool
  private(set) var numberOfQuestions: Int
  var numberAnswered: Int = 0
  var numberCorrect: Int = 0
  private(set) var challenges: [Challenge] = []
  private(set) var challenge: Challenge
  
  init() {
    self.numberOfQuestions = 10
    self.timerOn = false
    challenge = Challenge()
    fillChallenges()
  }
  
  mutating func fillChallenges() {
    var randomChallenge = Challenge()
    for _ in 1...numberOfQuestions {
      while(challenges.contains(randomChallenge)){
          randomChallenge = challenge.randomChallenge()
      }
      self.challenges.append(randomChallenge)
    }
  }
  
  func getAnswerText(index: Int) -> String {
    return challenges[index].answerText
  }
  
  func getQuestionText(index: Int) -> String {
    return challenges[index].questionText
  }
  
  func getQuestionTypeText(index: Int) -> String {
    return challenges[index].questionTypeText
  }
  
  func quizScore() -> String {
    switch numberCorrect {
    case 10:
      return "Perfect! 🏆"
    case 9:
      return "Wow! You get an A! 🥇"
    case 8:
      return "Not bad! That's a solid B. 🥈"
    case 7:
      return "You passed, but keep working for a trophy! 🥉"
    default:
      return "Keep practicing. You can do it!"
    }
  }
}
