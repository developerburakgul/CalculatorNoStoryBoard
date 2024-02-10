//
//  CustomButton.swift
//  CalculatorNoStoryBoard
//
//  Created by Burak Gül on 4.02.2024.
//

import UIKit

class CustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    convenience init(typeButon : TypeButton) {
        self.init(frame: .zero)
        configuration(typeButon)
    }
    
    func configuration(_ typeButton : TypeButton) {
        switch typeButton {
        case .operationButton(let operationButton):
            switch operationButton {
            
            case .acOperationButton(let acOperationButton):
                self.configuration = .filled()
                self.configuration?.cornerStyle = .capsule
                self.configuration?.baseBackgroundColor = acOperationButton.color
                
                self.setTitleColor(.black, for: .normal)
                self.setTitle(acOperationButton.rawValue, for: .normal)
                self.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            case .specialOperationButtons(let specialOperationButton):
                self.configuration = .filled()
                self.configuration?.cornerStyle = .capsule
                self.configuration?.baseBackgroundColor = specialOperationButton.color
                //                self.backgroundColor = .gray
                self.setTitleColor(.black, for: .normal)
                self.setTitle(specialOperationButton.rawValue, for: .normal)
                self.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            case .arithmeticOperationButtons(let arithmeticOperationButton):
                self.configuration = .filled()
                self.configuration?.cornerStyle = .capsule
                self.configuration?.baseBackgroundColor = arithmeticOperationButton.color
                //                self.backgroundColor = .systemOrange
                self.setTitleColor(.white, for: .normal)
                self.setTitle(arithmeticOperationButton.rawValue, for: .normal)
                self.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            case .plusMinusOperationButtons(let plusMinusOperationButton):
                self.configuration = .filled()
                self.configuration?.cornerStyle = .capsule
                self.configuration?.baseBackgroundColor = plusMinusOperationButton.color
                //                self.backgroundColor = .systemOrange
                self.setTitleColor(.white, for: .normal)
                self.setTitle(plusMinusOperationButton.rawValue, for: .normal)
                self.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            case.equalOperationButton(let equalOperationButton):
                self.configuration = .filled()
                self.configuration?.cornerStyle = .capsule
                self.configuration?.baseBackgroundColor = equalOperationButton.color
                //                self.backgroundColor = .systemOrange
                self.setTitleColor(.white, for: .normal)
                self.setTitle(equalOperationButton.rawValue, for: .normal)
                self.titleLabel?.font = UIFont.systemFont(ofSize: 40)
            }
        case .numberButton(let numberButton):
            self.configuration = .filled()
            self.configuration?.cornerStyle = .capsule
            self.configuration?.baseBackgroundColor = numberButton.color
            //            self.backgroundColor = .darkGray
            self.setTitleColor(.white, for: .normal)
            self.setTitle(numberButton.rawValue, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 40)
        }
    }
    
}

