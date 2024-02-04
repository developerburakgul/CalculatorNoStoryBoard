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
            case .buttonAC,.buttonChangeSign,.buttonPercentage:
                self.backgroundColor = .gray
                self.setTitleColor(.black, for: .normal)
                self.setTitle(operationButton.rawValue, for: .normal)
                self.titleLabel?.font = UIFont.systemFont(ofSize: 30)
            default:
                self.backgroundColor = .systemOrange
                self.setTitleColor(.white, for: .normal)
                self.setTitle(operationButton.rawValue, for: .normal)
                self.titleLabel?.font = UIFont.systemFont(ofSize: 30)
            }
    
        case .numberButton(let numberButton):
            self.backgroundColor = .darkGray
            self.setTitleColor(.white, for: .normal)
            self.setTitle(numberButton.rawValue, for: .normal)
            self.titleLabel?.font = UIFont.systemFont(ofSize: 30)
        }
        
  

    }
    
}
