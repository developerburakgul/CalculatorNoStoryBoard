//
//  CalculatorLogic.swift
//  CalculatorNoStoryBoard
//
//  Created by Burak Gül on 4.02.2024.
//

import Foundation


struct CalculatorLogic {
    private var currentResult : Double?
    private var number1 : Double?
    private var operation1 : OperationButton?
    private var number2 : Double?
    private var operation2 : OperationButton?
    private var number3 : Double?
    private var operation3 : OperationButton?
    
    private var isNilnumber1 : Bool {
        return number1 == nil
    }
    private var isNilnumber2 : Bool {
        return number2 == nil
    }
    private var isNilnumber3 : Bool {
        return number3 == nil
    }
    private var isNiloperation1 : Bool {
        return operation1 == nil
    }
    private var isNiloperation2 : Bool {
        return operation2 == nil
    }
    private var isNilOperation3 : Bool {
        return operation3 == nil
    }
    //MARK: - Public Functions
    mutating func setNumber(_ number : Double)  {
//        if isNiloperation1 && isNiloperation2 && isNilOperation3{
//            number1 = number
//        }else if !isNiloperation1 && isNiloperation2 && isNilOperation3 {
//            number2 = number
//        }else if !isNiloperation1 && !isNiloperation2  && isNilOperation3{
//            number3 = number
//        }
        let operationStates = (isNiloperation1, isNiloperation2, isNilOperation3)
        switch operationStates {
        case (true, true, true):
            number1 = number
        case (false, true, true):
            number2 = number
        case (false, false, true):
            number3 = number
        default:
            fatalError("Unexpected case")
        }
    }
    mutating func calculate(symbol : String) throws -> Double? {
        setOperation(symbol)
        var result : Double? = nil
        do {
             result = try getResult()
        } catch  {
            throw error
        }
        return result
    }
    //MARK: - Private Functions
    private func createOperationButton(from symbol: String) -> OperationButton? {
        if let acCase = AcOperationButton(rawValue: symbol) {
            return .acOperationButton(acCase)
        } else if let equalCase = EqualOperationButton(rawValue: symbol) {
            return .equalOperationButton(equalCase)
        } else if let specialCase = SpecialOperationButtons(rawValue: symbol) {
            return .specialOperationButtons(specialCase)
        } else if let arithmeticCase = ArithmeticOperationButtons(rawValue: symbol) {
            return .arithmeticOperationButtons(arithmeticCase)
        } else if let plusMinusCase = PlusMinusOperationButtons(rawValue: symbol) {
            return .plusMinusOperationButtons(plusMinusCase)
        }
        // Eğer geçerli bir enum bulunamazsa, nil döndürür.
        return nil
    }
    private mutating func setOperation(_ symbol : String) {
//        guard let operationButton =  OperationButton(rawValue: symbol) else {fatalError("Operation Button could not create")}
//        guard let operationButton =  OperationButton.Type else {fatalError("Operation Button could not create")}
        guard let operationButton = createOperationButton(from: symbol) else {fatalError("Operation Button could not create")}
        if  !isNilnumber1 && isNilnumber2 && isNilnumber3{
            operation1 = operationButton
        }else if !isNilnumber1 && !isNilnumber2 && isNilnumber3 {
            operation2 = operationButton
        }else if !isNilnumber1 && !isNilnumber2 && !isNilnumber3 {
            operation3 = operationButton
        }
    }
    private mutating func getResult() throws -> Double? {
        var f1 = notNil_number1_operation1()
        var f2 : Double?
        var f3 : Double?
        do {
            f2 = try notNil_number1_operation1_number2_operation2()
            f3 = try notNil_number1_operation1_number2_operation2_number3()
        } catch  {
            throw error
        }

        if f1 != nil {
            return f1
        }else if f2 != nil {
            return f2
        }else if f3 != nil {
            return f3
        }
        return nil
    }
    private mutating func notNil_number1_operation1() -> Double? {
        if !isNilnumber1 && !isNiloperation1 && isNilnumber2 && isNiloperation2 && isNilnumber3 && isNilOperation3 {
            switch operation1!{
            case .acOperationButton(let acOperationButton): // Number1 AC     = 2 Ac
                number1 = 0
                operation1 = nil
                number2 = nil
                operation2 = nil
                number3 = nil
                operation3 = nil
                return number1
            case .specialOperationButtons(let specialOperationButtons):
                switch specialOperationButtons{
                case.buttonChangeSign:
                    number1 = number1! * -1
                    operation1 = nil
                    return number1
                case.buttonPercentage:
                    number1 = number1! * 0.01
                    operation1 = nil
                    return number1
                }
            case .equalOperationButton(let equalOperationButton):
                operation1 = nil
                return number1
            case .plusMinusOperationButtons(let plusMinusOperationButtons):
                return number1
            case .arithmeticOperationButtons(let arithmeticOperationButtons):
                return number1
            }
        }
        return nil
    }
    
    private mutating func notNil_number1_operation1_number2_operation2() throws -> Double? {
        if !isNilnumber1 && !isNiloperation1 && !isNilnumber2 && !isNiloperation2 && isNilnumber3  && isNilOperation3{
            switch operation2!{
            case .acOperationButton(let acOperationButton):
                number1 = 0
                operation1 = nil
                number2 = nil
                operation2 = nil
                number3 = nil
                operation3 = nil
                return number1
            case .specialOperationButtons(let specialOperationButtons):
                switch specialOperationButtons {
                case.buttonChangeSign:
                    number2 = number2! * -1
                    operation2 = nil
                    return number2 // in here can be error
                case.buttonPercentage:
                    number2 = number2! * 0.01
                    operation2 = nil
                    return number2 // in here can be error
                }
            case .equalOperationButton(let equalOperationButton): // operation 2 is = and operation 1 is +,-,*,/
                var resultData : Double?
                switch operation1!{
                case .plusMinusOperationButtons(let plusMinusOperationButtons):
                    switch plusMinusOperationButtons {
                    case.buttonPlus:
                        resultData = number1! + number2!
                    case.buttonMinus:
                        resultData = number1! - number2!
                    }
                case .arithmeticOperationButtons(let arithmeticOperationButtons):
                    switch arithmeticOperationButtons {
                    case .buttonMultiplication:
                        resultData = number1! * number2!
                    case .buttonDivide:
                        if number2! == 0.0 {
                            throw LogicError.divisionByZero
                        }
                        resultData = Double(number1!) / Double(number2!) // in here number2 should not be 0 handle this case
                    }
                default:
                    fatalError("Operation 2 is = and operation 1 are =,AC,%,+/- this is not possible")
                }
                number1 = resultData!
                operation1 = nil
                number2 = nil
                operation2 = nil
                return resultData
            case .plusMinusOperationButtons(let plusMinusOperationButtons): // operation2 is +,- and operation1 is +,-,x,/
                var resultData : Double?
                switch operation1!{
                case .plusMinusOperationButtons(let plusMinusOperationButtons):
                    switch plusMinusOperationButtons {
                    case.buttonPlus:
                        resultData = number1! + number2!
                    case.buttonMinus:
                        resultData = number1! - number2!
                    }
                case .arithmeticOperationButtons(let arithmeticOperationButtons):
                    switch arithmeticOperationButtons {
                    case .buttonMultiplication:
                        resultData = number1! * number2!
                    case .buttonDivide:
                        if number2! == 0.0 {
                            throw LogicError.divisionByZero
                        }
                        resultData = Double(number1!) / Double(number2!) // in here number2 should not be 0 handle this case
                    }
                default:
                    fatalError("Operation 2 is +,-and operation 1 are =,AC,%,+/- this is not possible")
                }
                number1 = resultData!
                operation1 = operation2
                number2 = nil
                operation2 = nil
                return resultData
            case .arithmeticOperationButtons(let arithmeticOperationButtons): // operation2 is X,/ and operation1 is X,/
                var resultData : Double?
                switch operation1!{
                case .arithmeticOperationButtons(let arithmeticOperationButtons):
                    switch arithmeticOperationButtons {
                    case .buttonMultiplication:
                        resultData = number1! * number2!
                    case .buttonDivide:
                        if number2! == 0.0 {
                            throw LogicError.divisionByZero
                        }
                        resultData = Double(number1!) / Double(number2!) // in here number2 should not be 0 handle this case
                    }
                default:
                    return nil
//                    fatalError("Operation 2 is X,/ and operation 1 are =,AC,%,+/- ,+,- this is not possible")
                    // this fatal error should not write here
                }
                number1 = resultData!
                operation1 = operation2
                number2 = nil
                operation2 = nil
                return resultData
            }
        }
        return nil
    }
   
    private mutating func notNil_number1_operation1_number2_operation2_number3() throws -> Double? {
        if !isNilnumber1 && !isNiloperation1 && !isNilnumber2 && !isNiloperation2 && !isNilnumber3 {
            switch operation3 {
            case .acOperationButton(let acOperationButton): // 2 + 3 X 5 AC, 2 - 3 X 5 AC
                number1 = 0
                operation1 = nil
                number2 = nil
                operation2 = nil
                number3 = nil
                operation3 = nil
                return number1
            case .specialOperationButtons(let specialOperationButtons): // 2 + 3 X (500 % )  2 + 3 X (500 +/-)     2 - 3 X (500 % )  2 - 3 X (500 +/-)
                switch specialOperationButtons {
                case .buttonChangeSign:
                    number3 = number3! * -1
                case .buttonPercentage:
                    number3 = number3! * 0.01
                }
                operation3 = nil
                
            case .equalOperationButton(let equalOperationButton): // 2 + 3 X 5 = , 2 - 3 X 5 = , 2 + (3 / 5) =, 2 - (3/5) =
                var result : Double?
                var leftSideResult = number1
                var rightSideResult : Double?
                
                
                
                switch operation2!{
                case .arithmeticOperationButtons(let arithmeticOperationButtons):
                    switch arithmeticOperationButtons {
                    case .buttonMultiplication:
                        rightSideResult = number2! * number3!
                    case .buttonDivide:
                        if number3! == 0.0 {
                            throw LogicError.divisionByZero
                        }
                        rightSideResult = (number2!) / (number3!)
                    }
                default:
                    fatalError("Operation 2 can not be AC,+/-,%,+,-,=")
                }
                switch operation1!{
                
                case .plusMinusOperationButtons(let plusMinusOperationButtons):
                    switch plusMinusOperationButtons {
                    case .buttonPlus:
                        result = leftSideResult! + rightSideResult!
                    case .buttonMinus:
                        result = leftSideResult! - rightSideResult!
                    }
                
                default:
                    fatalError("Operation 1 can not be AC,+/-,%,X,/,=")
                }
                number1 = result
                operation1 = nil
                number2 = nil
                operation2 = nil
                number3 = nil
                operation3 = nil
                return number1
                
            case .plusMinusOperationButtons(let plusMinusOperationButtons): // 2 + 3 X 5 + , 2 - 3 X 5 + , 2 + (3 / 5) +, 2 - (3/5) + , 2 + 3 X 5 - , 2 - 3 X 5 - , 2 + (3 / 5) -, 2 - (3/5) -
                var result : Double?
                var leftSideResult = number1
                var rightSideResult : Double?
                
                
                
                switch operation2!{
                case .arithmeticOperationButtons(let arithmeticOperationButtons):
                    switch arithmeticOperationButtons {
                    case .buttonMultiplication:
                        rightSideResult = number2! * number3!
                    case .buttonDivide:
                        if number3! == 0.0 {
                            throw LogicError.divisionByZero
                        }
                        rightSideResult = (number2!) / (number3!)
                    }
                default:
                    fatalError("Operation 2 can not be AC,+/-,%,+,-,=")
                }
                switch operation1!{
                
                case .plusMinusOperationButtons(let plusMinusOperationButtons):
                    switch plusMinusOperationButtons {
                    case .buttonPlus:
                        result = leftSideResult! + rightSideResult!
                    case .buttonMinus:
                        result = leftSideResult! - rightSideResult!
                    }
                
                default:
                    fatalError("Operation 1 can not be AC,+/-,%,X,/,=")
                }
                number1 = result
                operation1 = operation3
                number2 = nil
                operation2 = nil
                number3 = nil
                operation3 = nil
                return number1
            case .arithmeticOperationButtons(let arithmeticOperationButtons):
                var result : Double?
                var leftSideResult = number1
                var rightSideResult : Double?
                switch operation2! {
                case .arithmeticOperationButtons(let arithmeticOperationButtons):
                    switch arithmeticOperationButtons {
                    case .buttonMultiplication:
                        number2 = number2! * number3!
                    case .buttonDivide:
                        if number3! == 0.0 {
                            throw LogicError.divisionByZero
                        }
                        number2 = (number2!)/(number3!)
                    }
                    
                default:
                    fatalError("Operation 2 cannot be AC,+/-,%,+,-,= because operation 2 should be X or /")
                }
                operation2 = operation3
                number3 = nil
                operation3 = nil
                return number2
                
                return nil
            case nil:
                return nil
            }
        }
        return nil
    }
    
}
