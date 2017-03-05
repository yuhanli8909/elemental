//
//  Challenge.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-03-02.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

import GameKit


// Enum to contain the types of questions available

enum QuestionType: String {
  case nameToAtomicSymbol
  case nameToAtomicNumber
  case atomicSymbolToName
  case atomicSymbolToAtomicNumber
  case atomicNumberToName
  case atomicNumberToAtomicSymbol
}


// This struct conforms to Equatable to make it possible
// to ensure unique challenges are added to the collection in the Quiz

struct Challenge {
  private(set) var answers = Answers()
  // Creation of array containing the different types of questions
  private let questionTypes = [QuestionType.nameToAtomicSymbol, QuestionType.nameToAtomicNumber, QuestionType.atomicSymbolToName, QuestionType.atomicSymbolToAtomicNumber, QuestionType.atomicNumberToName, QuestionType.atomicNumberToAtomicSymbol]

  private(set) var questionType: QuestionType
  private(set) var questionText: String
  private(set) var questionTypeText: String
 // private(set) var answerText: String
  private(set) var correctText: String
  private(set) var answerTexts: [String]
  private(set) var choicesToDisplay = GKRandomSource.sharedRandom().nextInt(upperBound: 2) + 2
  
  
  init() {
    self.answers = Answers()
    questionType = questionTypes[GKRandomSource.sharedRandom().nextInt(upperBound: questionTypes.count)]
    correctText = Challenge.getAnswerString(questionType: questionType, answer: answers.correctAnswer)
    questionTypeText = Challenge.getQuestionTypeText(questionType: questionType)
    questionText = Challenge.getQuestionString(questionType: questionType, answer: answers.correctAnswer)
    answerTexts = []
    fillAnswerTexts()
  }
  
  // Determine the string to be presented based on the Element and the QuestionType

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
  
  
  // Function to fill this array with choices to be presented to the user
  
  mutating func fillAnswerTexts() {
    for answer in answers.answerSet {
      answerTexts.append(Challenge.getAnswerString(questionType: questionType, answer: answer))
    }
  }
  
  
  // Function to determine what should be placed on the label to indicate to the user
  // what type of question this is

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
  
  
  // Function to determine the question to be displayed to the user
  // based both on the correct Element that was chose and the question type
  
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
  
  
  // Function to generate a random challenge
  // A new correct element is chosen along with the number of choices to display
  // and a new question type.  The answer string array is filled with new unique
  // strings for both correct answer and incorrect answers
  
  mutating func randomChallenge() -> Challenge {
    var newChallenge = Challenge()
    newChallenge.answers.correctAnswer = answers.periodicTable.randomElement()
    newChallenge.fillAnswerTexts()
    newChallenge.choicesToDisplay = GKRandomSource.sharedRandom().nextInt(upperBound: 2) + 2
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





