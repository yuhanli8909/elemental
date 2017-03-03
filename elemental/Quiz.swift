//
//  Quiz.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-03-02.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

struct Quiz {
  private var timerOn: Bool
  var numberOfQuestions: Int
  var numberCorrect: Int = 0
  var challenges: [Challenge] = []
  private(set) var challenge: Challenge
  
  init() {
    self.numberOfQuestions = 5
    self.timerOn = false
    challenge = Challenge()
    fillChallenges()
  }
  
  mutating func fillChallenges() {
    for _ in 1...numberOfQuestions {
      self.challenges.append(challenge)
    }
  }
}
