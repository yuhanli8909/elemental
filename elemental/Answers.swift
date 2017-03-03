//
//  Answers.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-03-03.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

import GameKit

struct Answers {
  private(set) var correctAnswer: Element
  var numberIncorrect: Int = 3


  private(set) var answerSet: [Element]
  let periodicTable: PeriodicTable = PeriodicTable()
  
  init() {
    self.correctAnswer = periodicTable.randomElement()
    self.answerSet = []
    
    fillAnswerSet()
    shuffleAnswerSet()
  }

  mutating func fillAnswerSet() {
    var randomElement = periodicTable.randomElement()
    answerSet.append(correctAnswer)
    for _ in 1...numberIncorrect {
      while(answerSet.contains(randomElement)) {
        randomElement = periodicTable.randomElement()
      }
      answerSet.append(randomElement)
    }
  }
  
  mutating func shuffleAnswerSet() {
    answerSet = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: answerSet) as! [Element]
  }
  
  mutating func randomAnswers() -> Answers {
    let randomAnswers = Answers()
    return randomAnswers
  }
}
