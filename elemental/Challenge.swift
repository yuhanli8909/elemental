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
  private(set) var answers = Answers()
  private let questionTypes = [QuestionType.nameToAtomicSymbol, QuestionType.nameToAtomicNumber, QuestionType.atomicSymbolToName, QuestionType.atomicSymbolToAtomicNumber, QuestionType.atomicNumberToName, QuestionType.atomicNumberToAtomicSymbol]

  private(set) var questionType: QuestionType = QuestionType.atomicNumberToAtomicSymbol
  private(set) var questionText: String
  private(set) var questionTypeText: String
  private(set) var answerText: String
  private(set) var answerTexts: [String] = []
  private(set) var choicesToDisplay = GKRandomSource.sharedRandom().nextInt(upperBound: 2) + 2
  
  
  init() {
    self.answers = Answers()
    questionType = questionTypes[GKRandomSource.sharedRandom().nextInt(upperBound: questionTypes.count)]
    questionTypeText = Challenge.getQuestionTypeText(questionType: questionType)
    questionText = Challenge.getQuestionString(questionType: questionType, answer: answers.correctAnswer)
    answerText = Challenge.getAnswerString(questionType: questionType, answer: answers.correctAnswer)
    fillAnswerTexts()
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
      return String(answer.atomicNumber)
    case .atomicNumberToName:
      return answer.name
    case.atomicNumberToAtomicSymbol:
      return answer.atomicSymbol
    }
  }
  
  mutating func fillAnswerTexts() {
    for answer in answers.answerSet {
      answerTexts.append(Challenge.getAnswerString(questionType: questionType, answer: answer))
    }
  }

  static func getQuestionTypeText(questionType: QuestionType) -> String {
    switch questionType {
    case .nameToAtomicSymbol:
      return "Name  → Symbol"
    case .nameToAtomicNumber:
      return "Name  → Number"
    case .atomicSymbolToName:
      return "Symbol → Name"
    case .atomicSymbolToAtomicNumber:
      return "Symbol → Number"
    case .atomicNumberToName:
      return "Number → Name"
    case .atomicNumberToAtomicSymbol:
      return "Number → Symbol"
    }
  }
  
  static func getQuestionString(questionType: QuestionType, answer: Element) -> String {
    switch questionType {
    case .nameToAtomicSymbol:
      return "What is the \n atomic symbol for \(answer.name)?"
    case .nameToAtomicNumber:
      return "What is the \n atomic number for \(answer.name)?"
    case .atomicSymbolToName:
      return "Which element has the \n atomic symbol \(answer.atomicSymbol)?"
    case .atomicSymbolToAtomicNumber:
      return "What is the atomic number for \(answer.atomicSymbol)?"
    case .atomicNumberToName:
      return "Which element has the \n atomic number \(answer.atomicNumber)?"
    case .atomicNumberToAtomicSymbol:
      return "What is the atomic symbol for \n the atomic number \(answer.atomicNumber)?"
    }
  }
  
  mutating func randomChallenge() -> Challenge {
    var newChallenge = Challenge()
    newChallenge.answers.correctAnswer = answers.periodicTable.randomElement()
    newChallenge.answers = answers.randomAnswers()
    fillAnswerTexts()
    newChallenge.questionType = questionTypes[GKRandomSource.sharedRandom().nextInt(upperBound: questionTypes.count)]
    return newChallenge
  }
}

extension Challenge: Equatable {
  static func == (lhs: Challenge, rhs: Challenge) -> Bool {
    return
      lhs.questionType == rhs.questionType &&
      lhs.answers.correctAnswer == rhs.answers.correctAnswer
  }
}





