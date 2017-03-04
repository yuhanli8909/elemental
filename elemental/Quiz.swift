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
}
