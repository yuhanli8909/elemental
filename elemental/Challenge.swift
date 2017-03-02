//
//  Challenge.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-03-02.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

import GameKit

enum QuestionType: String {
  case nameToAtomicSymbol
  case nameToAtomicNumber
  case atomicSymbolToName
  case atomicSymbolToAtomicNumber
  case atomicNumberToName
  case atomicNumberToAtomicSymbol
}


struct Challenge {
  private let answer: Element
  private let choices: Choices = Choices()
  let questionTypes = [QuestionType.nameToAtomicSymbol, QuestionType.nameToAtomicNumber, QuestionType.atomicSymbolToName, QuestionType.atomicSymbolToAtomicNumber, QuestionType.atomicNumberToName, QuestionType.atomicNumberToAtomicSymbol]

  private var questionType: QuestionType = QuestionType.atomicNumberToAtomicSymbol
  private let questionText: String
  private var answerText: String
  private let questionTypeText: String
  
  init() {
    self.answer = choices.answer
    questionType = questionTypes[GKRandomSource.sharedRandom().nextInt(upperBound: questionTypes.count)]
    answerText = Challenge.getAnswerString(questionType: questionType, answer: answer)
    questionText = Challenge.getQuestionTypeText(questionType: questionType)
    answerText = Challenge.getAnswerString(questionType: questionType, answer: answer)
    questionTypeText = Challenge.getQuestionTypeText(questionType: questionType)
  }
  
  
  static func getAnswerString(questionType: QuestionType, answer: Element) -> String {
    switch questionType {
    case .nameToAtomicSymbol:
      return answer.atomicSymbol
    case .nameToAtomicNumber:
      return String(answer.atomicNumber)
    case .atomicSymbolToName:
      return answer.name
    case.atomicSymbolToAtomicNumber:
      return String(answer.name)
    case .atomicNumberToName:
      return answer.name
    case.atomicNumberToAtomicSymbol:
      return answer.atomicSymbol
    }
  }
  
  static func getQuestionTypeText(questionType: QuestionType) -> String {
    switch questionType {
    case .nameToAtomicSymbol:
      return "Name -> Symbol"
    case .nameToAtomicNumber:
      return "Name -> Number"
    case .atomicSymbolToName:
      return "Symbol -> Name"
    case .atomicSymbolToAtomicNumber:
      return "Symbol -> Number"
    case .atomicNumberToName:
      return "Number -> Name"
    case .atomicNumberToAtomicSymbol:
      return "Number -> Symbol"
    }
  }
  
  static func getQuestionString(questionType: QuestionType, answer: Element) -> String {
    switch questionType {
    case .nameToAtomicSymbol:
      return "What is the atomic symbol for \(answer.name)?"
    case .nameToAtomicNumber:
      return "What is the atomic number for \(answer.name)?"
    case .atomicSymbolToName:
      return "Which element has the atomic symbol \(answer.atomicSymbol)?"
    case .atomicSymbolToAtomicNumber:
      return "What is the atomic number associated with the atomic symbol \(answer.atomicSymbol)?"
    case .atomicNumberToName:
      return "Which element has the atomic number \(answer.atomicNumber)?"
    case .atomicNumberToAtomicSymbol:
      return "Which atomic symbol is associated with the atomic number \(answer.atomicNumber)?"
    }
  }
}
