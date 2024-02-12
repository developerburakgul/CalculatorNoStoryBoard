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
        self.configuration = .filled()
        self.configuration?.cornerStyle = .capsule
        switch typeButton {
        case .operationButton(let operationButton):
            switch operationButton {
                
            case .acOperationButton(let acOperationButton):
                
                self.configuration?.baseBackgroundColor = acOperationButton.color
                
                
                self.setTitleColor(.black, for: .normal)
                self.setTitle(acOperationButton.rawValue, for: .normal)
//                self.titleLabel?.font = UIFont.systemFont(ofSize: 300,weight: .bold)
            case .specialOperationButtons(let specialOperationButton):
                self.configuration?.baseBackgroundColor = specialOperationButton.color
                self.setTitleColor(.black, for: .normal)
                self.setTitle(specialOperationButton.rawValue, for: .normal)
//                self.titleLabel?.font = UIFont.systemFont(ofSize: 60,weight: .bold)
            case .arithmeticOperationButtons(let arithmeticOperationButton):
                self.configuration?.baseBackgroundColor = arithmeticOperationButton.color
                self.setTitleColor(.white, for: .normal)
                self.setTitle(arithmeticOperationButton.rawValue, for: .normal)
//                self.titleLabel?.font = UIFont.systemFont(ofSize: 60,weight: .bold)
            case .plusMinusOperationButtons(let plusMinusOperationButton):
                self.configuration?.baseBackgroundColor = plusMinusOperationButton.color
                self.setTitleColor(.white, for: .normal)
                self.setTitle(plusMinusOperationButton.rawValue, for: .normal)
//                self.titleLabel?.font = UIFont.systemFont(ofSize: 60,weight: .bold)
            case.equalOperationButton(let equalOperationButton):
                self.configuration?.baseBackgroundColor = equalOperationButton.color
                self.setTitleColor(.white, for: .normal)
                self.setTitle(equalOperationButton.rawValue, for: .normal)
//                self.titleLabel?.font = UIFont.systemFont(ofSize: 60,weight: .bold)
            }
            
        case .numberButton(let numberButton):
            self.configuration?.baseBackgroundColor = numberButton.color
            self.setTitleColor(.white, for: .normal)
            self.setTitle(numberButton.rawValue, for: .normal)
//            self.titleLabel?.font = UIFont.systemFont(ofSize: 60,weight: .bold)
            self.configurationUpdateHandler = { [weak self] button in
                guard let self = self else { return }
                var updatedConfig = self.configuration
                if button.isHighlighted || button.isTouchInside {
                    updatedConfig?.baseBackgroundColor = numberButton.selectedBackgroundColor // Basılı durum için arka plan rengi
                } else {
                    updatedConfig?.baseBackgroundColor = numberButton.color// Normal durum için arka plan rengi
                }
                self.configuration = updatedConfig
            }
           
        }
        
        if #available(iOS 15.0, *) {
             let transformer = UIConfigurationTextAttributesTransformer { incoming in
                 var outgoing = incoming
                 outgoing.font = UIFont.systemFont(ofSize: 25, weight: .medium) // Örnek değer
                 return outgoing
             }
             self.configuration?.titleTextAttributesTransformer = transformer
         } else {
             // iOS 15 öncesi için titleLabel fontunu doğrudan ayarla
             self.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
         }

    }
    
}


//extension CustomButton{
//    override open var isHighlighted: Bool {
//        didSet {
//            super.isHighlighted = isHighlighted
//            backgroundColor = isHighlighted ? UIColor.red : UIColor.black
//        }
//    }
//}



