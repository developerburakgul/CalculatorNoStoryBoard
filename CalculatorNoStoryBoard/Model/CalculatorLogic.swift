//
//  CalculatorLogic.swift
//  CalculatorNoStoryBoard
//
//  Created by Burak Gül on 4.02.2024.
//

import Foundation


struct CalculatorLogic {
    private var number : Double?
    private var intermediateCalculation : (number : Double,calculationMethod : String)?
    
    
    mutating func setNumber(_ number : Double)  {
        self.number = number
    }
    
    mutating func calculate(symbol : String) -> Double? {
        if let number = number {
            switch symbol {
            case OperationButton.buttonAC.rawValue:
                return number * 0.0
            case OperationButton.buttonPercentage.rawValue:
                return number * 0.01
            case OperationButton.buttonChangeSign.rawValue:
                return number * -1
            case OperationButton.buttonEqual.rawValue:
                return performTwoNumberCalculation(number2 : number)
            default:
                intermediateCalculation = (number : number, calculationMethod : symbol)
                
                
            }
        }
        return nil
    }
    
    private func performTwoNumberCalculation(number2 : Double) -> Double? {
        guard let number = intermediateCalculation?.number , let operation = intermediateCalculation?.calculationMethod else {return nil}
        
        switch operation {
        case OperationButton.buttonPlus.rawValue:
            return number + number2
        case OperationButton.buttonMinus.rawValue:
            return number - number2
        case OperationButton.buttonMultiplication.rawValue:
            return number * number2
        case OperationButton.buttonDivide.rawValue:
            return number / number2
        default:
            return nil
        }
    }
}
