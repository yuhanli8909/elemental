//
//  Answers.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-03-03.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

import GameKit


// Stuct containg answers.  Given that it holds both a correct answer and three 
// incorrect answers, I chose the plural form when naming this one.

struct Answers {
  var correctAnswer: Element
  var numberIncorrect: Int = 3

  private(set) var answerSet: [Element]
  let periodicTable: PeriodicTable = PeriodicTable()
  
  init() {
    self.correctAnswer = periodicTable.randomElement()
    self.answerSet = []
    
    fillAnswerSet()
    shuffleAnswerSet()
  }

  // Function to fill the array with the correct answer and incorrect answers
  // Because Element is Equatable we can guarantee unique elements.  This prevents
  // the same element showing up multiple times.  We start by appending the correct answer first
  // to ensure that it is present amongst the answer set
  
  mutating func fillAnswerSet() -> Void {
    var randomElement = periodicTable.randomElement()
    answerSet.append(correctAnswer)
    for _ in 1...numberIncorrect {
      while(answerSet.contains(randomElement)) {
        randomElement = periodicTable.randomElement()
      }
      answerSet.append(randomElement)
    }
  }
  
  // Function to shuffle the answer set given that the correct answer will always be placed
  // in the array first.
  
  mutating func shuffleAnswerSet() -> Void {
    answerSet = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: answerSet) as! [Element]
  }
}



