//
//  ViewController.swift
//  CalculatorNoStoryBoard
//
//  Created by Burak Gül on 4.02.2024.
//

import UIKit

class ViewController: UIViewController {
    
    private var homeView =  HomeView()
    private var calculatorLogic = CalculatorLogic()
    private var isFinishedTypingNumber : Bool = true
    private var screenValue : Double {
        get {
            guard let stringNumber = homeView.label.text else {fatalError("Could not convert number that in the screen")}
            guard let number = Double(stringNumber) else {fatalError("Could not convert stringNumber to double")}
            return number
        }
        set {
            homeView.label.text = newValue.isInt == true ? "\(Int(newValue))" : "\(newValue)"
        }
    }
    
    //MARK: - LifeCycle Methods
    override func loadView() {
        super.loadView()
        view = homeView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        configurationActions()
    }
    //MARK: - Configuration
    private func configurationActions()  {
        homeView.button0.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        homeView.button1.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        homeView.button2.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        homeView.button3.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        homeView.button4.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        homeView.button5.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        homeView.button6.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        homeView.button7.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        homeView.button8.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        homeView.button9.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        homeView.buttonComma.addTarget(self, action: #selector(pressedNumber), for: .touchUpInside)
        
        homeView.buttonAC.addTarget(self, action: #selector(pressedOperation), for: .touchUpInside)
        homeView.buttonChangeSign.addTarget(self, action: #selector(pressedOperation), for: .touchUpInside)
        homeView.buttonPercentage.addTarget(self, action: #selector(pressedOperation), for: .touchUpInside)
        homeView.buttonDivide.addTarget(self, action: #selector(pressedOperation), for: .touchUpInside)
        homeView.buttonMultiplication.addTarget(self, action: #selector(pressedOperation), for: .touchUpInside)
        homeView.buttonMinus.addTarget(self, action: #selector(pressedOperation), for: .touchUpInside)
        homeView.buttonPlus.addTarget(self, action: #selector(pressedOperation), for: .touchUpInside)
        homeView.buttonEqual.addTarget(self, action: #selector(pressedOperation), for: .touchUpInside)
    }
    
    //MARK: - Functions
    @objc private func pressedNumber(_ sender : UIButton){
        if let stringNumber = sender.currentTitle {
            if isFinishedTypingNumber { // for the first digit
                isFinishedTypingNumber = false
                homeView.label.text = stringNumber
                homeView.buttonAC.setTitle("C", for: .normal)
            }else {
                if stringNumber == NumberButton.buttonDot.rawValue {
                    let dot = Character(NumberButton.buttonDot.rawValue)
                    if homeView.label.text?.last == dot {
                        return
                    }
                    let isInt = floor(screenValue) == screenValue
                    
                    if !isInt{ // in here number is not int , so we can return in here because . is used before
                        return
                    }
                }
                homeView.label.text = homeView.label.text! + stringNumber
            }
        }
    }
    @objc private func pressedOperation(_ sender : UIButton)  {
        if sender == homeView.buttonAC {
            homeView.buttonAC.setTitle("AC", for: .normal)
        }
        
        
        if !isFinishedTypingNumber {
            calculatorLogic.setNumber(screenValue)
        }
        isFinishedTypingNumber = true
        if let operation = sender.currentTitle {
            do {
                if let result = try calculatorLogic.calculate(symbol: operation) {
                    screenValue = result
                }
                
            } catch {
                homeView.label.text = "Error"
                
            }
        }
    }
}
#Preview(""){
    ViewController()
}
