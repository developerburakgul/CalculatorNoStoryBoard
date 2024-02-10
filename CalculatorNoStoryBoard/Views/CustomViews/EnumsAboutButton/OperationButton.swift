//
//  OperationButton.swift
//  CalculatorNoStoryBoard
//
//  Created by Burak Gül on 4.02.2024.
//

import Foundation
import UIKit

//enum OperationButton : String {
//    case buttonAC = "AC"
//    case buttonEqual = "="
//    
//    case buttonChangeSign = "+/-"
//    case buttonPercentage = "%"
//    
//    case buttonDivide = "÷"
//    case buttonMultiplication = "×"
//    
//    case buttonMinus = "-"
//    case buttonPlus = "+"
//    
//    
//}


enum OperationButton{
    case acOperationButton(AcOperationButton)
    case specialOperationButtons(SpecialOperationButtons)
    case equalOperationButton(EqualOperationButton)
    case plusMinusOperationButtons(PlusMinusOperationButtons)
    case arithmeticOperationButtons(ArithmeticOperationButtons)
    
}

enum AcOperationButton: String {
    case buttonAC = "AC"
    var color : UIColor {
        return .lightGray
    }

}
enum EqualOperationButton : String {
    case buttonEqual = "="
    var color : UIColor {
        return .systemOrange
    }
}

enum SpecialOperationButtons : String {
    case buttonChangeSign = "+/-"
    case buttonPercentage = "%"
    var color : UIColor {
        return .lightGray
    }
}

enum ArithmeticOperationButtons : String {
    case buttonDivide = "÷"
    case buttonMultiplication = "×"
    var color : UIColor {
        return .systemOrange
    }
}

enum PlusMinusOperationButtons : String{
    case buttonMinus = "-"
    case buttonPlus = "+"
    var color : UIColor {
        return .systemOrange
    }
}



