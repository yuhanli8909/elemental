//
//  PeriodicTable.swift
//  elemental
//
//  Created by Jennifer Nordell on 2017-02-28.
//  Copyright © 2017 Jennifer Nordell. All rights reserved.
//

import GameKit


// Creation of a class to hold a collection of struct instances of type Element

class PeriodicTable {
  private var periodicTable: [Element] = []
  
  init(){
    periodicTable.append(Element(name: "Hydrogen", atomicNumber: 1, atomicSymbol: "H"))
    periodicTable.append(Element(name: "Helium", atomicNumber: 2, atomicSymbol: "He"))
    periodicTable.append(Element(name: "Lithium", atomicNumber: 3, atomicSymbol: "Li"))
    periodicTable.append(Element(name: "Beryllium", atomicNumber: 4, atomicSymbol: "Be"))
    periodicTable.append(Element(name: "Boron", atomicNumber: 5, atomicSymbol: "B"))
    periodicTable.append(Element(name: "Carbon", atomicNumber: 6, atomicSymbol: "C"))
    periodicTable.append(Element(name: "Nitrogen", atomicNumber: 7, atomicSymbol: "N"))
    periodicTable.append(Element(name: "Oxygen", atomicNumber: 8, atomicSymbol: "O"))
    periodicTable.append(Element(name: "Fluorine", atomicNumber: 9, atomicSymbol: "F"))
    periodicTable.append(Element(name: "Neon", atomicNumber: 10, atomicSymbol: "Ne"))
    periodicTable.append(Element(name: "Sodium", atomicNumber: 11, atomicSymbol: "Na"))
    periodicTable.append(Element(name: "Magnesium", atomicNumber: 12, atomicSymbol: "Mg"))
    periodicTable.append(Element(name: "Aluminum", atomicNumber: 13, atomicSymbol: "Al"))
    periodicTable.append(Element(name: "Silicon", atomicNumber: 14, atomicSymbol: "Si"))
    periodicTable.append(Element(name: "Phosphorus", atomicNumber: 15, atomicSymbol: "P"))
    periodicTable.append(Element(name: "Sulfur", atomicNumber: 16, atomicSymbol: "S"))
    periodicTable.append(Element(name: "Chlorine", atomicNumber: 17, atomicSymbol: "Cl"))
    periodicTable.append(Element(name: "Argon", atomicNumber: 18, atomicSymbol: "Ar"))
    periodicTable.append(Element(name: "Potassium", atomicNumber: 19, atomicSymbol: "K"))
    periodicTable.append(Element(name: "Calcium", atomicNumber: 20, atomicSymbol: "Ca"))
  }
  
  
  // Function to return a random Element from the PeriodicTable
  
  func randomElement() -> Element {
    let randomIndex = GKRandomSource.sharedRandom().nextInt(upperBound: periodicTable.count)
    return periodicTable[randomIndex]
  }
}
