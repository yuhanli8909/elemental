//
//  Quiz.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-03-02.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

struct Quiz {
  private let timerOn: Bool
  private let numberOfQuestions: Int
  private var challenges: [Challenge] = []
  private let challenge = Challenge()
  
  init(timer timerOn: Bool, questions numberOfQuestions: Int) {
    self.timerOn = timerOn
    self.numberOfQuestions = numberOfQuestions
  }
  
  mutating func fillChallenges() {
    for _ in 1...numberOfQuestions {
      self.challenges.append(challenge)
    }
  }
}
