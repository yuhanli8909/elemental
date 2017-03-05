//
//  Quiz.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-03-02.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//


// A struct that contains a set of "Challenges" and also offers
// some computed properties available to the ViewController

struct Quiz {
  private var timerOn: Bool
  private(set) var numberOfQuestions: Int
  var currentChallengeIndex: Int
  var numberAnswered: Int = 0
  var numberCorrect: Int = 0
  private(set) var challenges: [Challenge] = []
  private(set) var challenge: Challenge
  
  // This is the string that stores the CORRECT answer
  var answerText: String {
    get {
      return challenges[currentChallengeIndex].correctText
    }
  }
  
  var questionText: String {
    get {
      return challenges[currentChallengeIndex].questionText
    }
  }
  
  var questionTypeText: String {
    get {
      return challenges[currentChallengeIndex].questionTypeText
    }
  }
  
  var answerTexts: [String] {
    get {
      return challenges[currentChallengeIndex].answerTexts
    }
  }
  
  var choicesToDisplay: Int {
    get {
      return challenges[currentChallengeIndex].choicesToDisplay
    }
  }
  
  init() {
    self.numberOfQuestions = 10
    self.timerOn = false
    currentChallengeIndex = 0
    challenge = Challenge()
    fillChallenges()
  }
  
  
  // Function to fill the challenge collection.  Challenges conform to Equatable
  // and are uniquely identifiable by the element picked combined with the question type.
  // This results in the ability to be asked more than one question on the same Element, but
  // NOT the same TYPE of question
  
  mutating func fillChallenges() {
    var randomChallenge = Challenge()
    for _ in 1...numberOfQuestions {
      while(challenges.contains(randomChallenge)){
          randomChallenge = challenge.randomChallenge()
      }
      self.challenges.append(randomChallenge)
    }
  }

  // Function to return a cute String to the user based on performance
  
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



