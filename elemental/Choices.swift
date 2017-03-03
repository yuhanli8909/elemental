//
//  Choices.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-03-01.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

import GameKit

struct Choices {
  let answer: Element
  private let numberOfIncorrect: Int
  var allChoices: [Element] = []
  private let periodicTable = PeriodicTable()
  
  init() {
    // Get random Element and assign to answer
    self.answer = periodicTable.randomElement()
    self.numberOfIncorrect = 3
    self.allChoices.append(answer)
    fillChoices()
    shuffleChoices()
  }
  
  
  /// Fill the array containing possible choices with incorrect answers
  
  mutating func fillChoices() {
    var choiceElement = self.periodicTable.randomElement()
    for _ in 1...numberOfIncorrect {
      while(allChoices.contains(choiceElement)){
        choiceElement = self.periodicTable.randomElement()
      }
      allChoices.append(choiceElement)
    }
  }
  
  mutating func shuffleChoices() {
    allChoices = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: allChoices) as! [Element]
  }
}

