//
//  ViewController.swift
//  CalculatorNoStoryBoard
//
//  Created by Burak Gül on 2.02.2024.
//

import UIKit

class HomeView: UIView {
    
    
    //MARK: - Label
     lazy var label : UILabel = {
       var label = UILabel()
        label.text = "0"
        label.textColor = .white
        label.textAlignment = .right
        label.font = UIFont.systemFont(ofSize: 40)
        return label
    }()
    //MARK: - Stack 1
     lazy var stackView1 : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    lazy var buttonAC = CustomButton(typeButon: .operationButton(.buttonAC))
    lazy var buttonChangeSign = CustomButton(typeButon: .operationButton(.buttonChangeSign))
    lazy var buttonPercentage = CustomButton(typeButon: .operationButton(.buttonPercentage))
    lazy var buttonDivide = CustomButton(typeButon: .operationButton(.buttonDivide))
    //MARK: - Stack 2
    lazy var stackView2 : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    lazy var button7 = CustomButton(typeButon: .numberButton(.button7))
    lazy var button8 = CustomButton(typeButon: .numberButton(.button8))
    lazy var button9 = CustomButton(typeButon: .numberButton(.button9))
    lazy var buttonMultiplication = CustomButton(typeButon: .operationButton(.buttonMultiplication))
    //MARK: - Stack 3
    lazy var stackView3 : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    lazy var button4 = CustomButton(typeButon: .numberButton(.button4))
    lazy var button5 = CustomButton(typeButon: .numberButton(.button5))
    lazy var button6 = CustomButton(typeButon: .numberButton(.button6))
    lazy var buttonMinus = CustomButton(typeButon: .operationButton(.buttonMinus))
    //MARK: - Stack 4
    lazy var stackView4 : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    lazy var button1 = CustomButton(typeButon: .numberButton(.button1))
    lazy var button2 = CustomButton(typeButon: .numberButton(.button2))
    lazy var button3 = CustomButton(typeButon: .numberButton(.button3))
    lazy var buttonPlus = CustomButton(typeButon: .operationButton(.buttonPlus))
    //MARK: - Stack 5
    lazy var stackView5 : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    lazy var button0 = CustomButton(typeButon: .numberButton(.button0))
    lazy var buttonComma = CustomButton(typeButon: .numberButton(.buttonDot))
    lazy var buttonEqual = CustomButton(typeButon: .operationButton(.buttonEqual))
    
    //MARK: - Init Methods
    override init(frame: CGRect) {
        super.init(frame: frame)
        configuration()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    //MARK: - Configuration Functions
    private func configuration() {
        backgroundColor = .black
        configurationStack5()
        configurationStack4()
        configurationStack3()
        configurationStack2()
        configurationStack1()
        configurationLabel()
    }
    
    private func configurationLabel() {
        addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            label.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 20),
            label.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -20),
            label.bottomAnchor.constraint(equalTo: stackView1.topAnchor, constant: -30)
        ])
    }
    
    private func configurationStack1() {
        stackView1.addArrangedSubview(buttonAC)
        stackView1.addArrangedSubview(buttonChangeSign)
        stackView1.addArrangedSubview(buttonPercentage)
        stackView1.addArrangedSubview(buttonDivide)
        
        stackView1.spacing = 10
        addSubview(stackView1)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView1.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView1.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView1.bottomAnchor.constraint(equalTo: stackView2.topAnchor, constant: -10),
            stackView1.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.25, constant: -12.5)
        ])
    }
    private func configurationStack2() {
        stackView2.addArrangedSubview(button7)
        stackView2.addArrangedSubview(button8)
        stackView2.addArrangedSubview(button9)
        stackView2.addArrangedSubview(buttonMultiplication)
        stackView2.spacing = 10
        addSubview(stackView2)
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView2.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView2.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView2.bottomAnchor.constraint(equalTo: stackView3.topAnchor, constant: -10),
            stackView2.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.25, constant: -12.5)
        ])
    }
    
    private func configurationStack3() {
        stackView3.addArrangedSubview(button4)
        stackView3.addArrangedSubview(button5)
        stackView3.addArrangedSubview(button6)
        stackView3.addArrangedSubview(buttonMinus)
        stackView3.spacing = 10
        addSubview(stackView3)
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView3.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView3.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView3.bottomAnchor.constraint(equalTo: stackView4.topAnchor, constant: -10),
            stackView3.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.25, constant: -12.5)
        ])
        
    }
    
    
    private func configurationStack4() {
        stackView4.addArrangedSubview(button1)
        stackView4.addArrangedSubview(button2)
        stackView4.addArrangedSubview(button3)
        stackView4.addArrangedSubview(buttonPlus)
        stackView4.spacing = 10
        addSubview(stackView4)
        stackView4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView4.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView4.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView4.bottomAnchor.constraint(equalTo: stackView5.topAnchor, constant: -10),
            stackView4.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.25, constant: -12.5)
        ])
    }
    private func configurationStack5(){
        let subStackView1 : UIStackView = UIStackView(arrangedSubviews: [button0])
        let subStackView2 : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [buttonComma,buttonEqual])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            return stackView
        }()
        stackView5.addArrangedSubview(subStackView1)
        stackView5.addArrangedSubview(subStackView2)
        stackView5.spacing = 10
        addSubview(stackView5)
        stackView5.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView5.leadingAnchor.constraint(equalTo: safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView5.trailingAnchor.constraint(equalTo: safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView5.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView5.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.25, constant: -10)
        ])
    }
    
}

#Preview(""){
    HomeView()

}
