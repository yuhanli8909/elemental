//
//  PeriodicTable.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-02-28.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

import GameKit

class PeriodicTable {
  private var periodicTable: [Element] = []
  
  init(){
    periodicTable.append(Element("Hydrogen", 1, atomicSymbol: "H"))
    periodicTable.append(Element("Helium", 2, atomicSymbol: "He"))
    periodicTable.append(Element("Lithium", 3, atomicSymbol: "Li"))
    periodicTable.append(Element("Beryllium", 4, atomicSymbol: "Be"))
    periodicTable.append(Element("Boron", 5, atomicSymbol: "B"))
    periodicTable.append(Element("Carbon", 6, atomicSymbol: "C"))
    periodicTable.append(Element("Nitrogen", 7, atomicSymbol: "N"))
    periodicTable.append(Element("Oxygen", 8, atomicSymbol: "O"))
    periodicTable.append(Element("Fluorine", 9, atomicSymbol: "F"))
    periodicTable.append(Element("Neon", 10, atomicSymbol: "Ne"))
    /*
    periodicTable.append(Element("Sodium", 11, atomicSymbol: "Na"))
    periodicTable.append(Element("Magnesium", 12, atomicSymbol: "Mg"))
    periodicTable.append(Element("Aluminum", 13, atomicSymbol: "Al"))
    periodicTable.append(Element("Silicon", 14, atomicSymbol: "Si"))
    periodicTable.append(Element("Phosphorus", 15, atomicSymbol: "P"))
    periodicTable.append(Element("Sulfur", 16, atomicSymbol: "S"))
    periodicTable.append(Element("Chlorine", 17, atomicSymbol: "Cl"))
    periodicTable.append(Element("Argon", 18, atomicSymbol: "Ar"))
    periodicTable.append(Element("Potassium", 19, atomicSymbol: "K"))
    periodicTable.append(Element("Calcium", 20, atomicSymbol: "Ca"))
     */
  }
  
  func randomElement() -> Element {
    let randomIndex = GKRandomSource.sharedRandom().nextInt(upperBound: periodicTable.count)
    return periodicTable[randomIndex]
  }
}
