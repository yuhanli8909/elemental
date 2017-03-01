//
//  Element.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-02-28.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

import Foundation

struct Element {
  let name: String
  let atomicNumber: UInt
  let atomicSymbol: String
  
  init(_ name: String, _ atomicNumber: UInt, atomicSymbol: String){
    self.name = name
    self.atomicNumber = atomicNumber
    self.atomicSymbol = atomicSymbol
  }
}

extension Element: Equatable {
  static func == (lhs: Element, rhs: Element) -> Bool {
    return
      lhs.name == rhs.name &&
      lhs.atomicNumber == rhs.atomicNumber &&
      lhs.atomicSymbol == rhs.atomicSymbol
  }
}
