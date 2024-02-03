//
//  ViewController.swift
//  CalculatorNoStoryBoard
//
//  Created by Burak Gül on 2.02.2024.
//

import UIKit

class ViewController: UIViewController {
    //MARK: - Stack 1
    
    private lazy var stackView1 : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        
        return stackView
    }()
    private lazy var buttonAC : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .gray
        button.setTitleColor(.black, for: .normal)
        button.setTitle("AC", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)

        return button
    }()
    private lazy var buttonChangeSign : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .gray
        button.setTitleColor(.black, for: .normal)
        button.setTitle("+/-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var buttonPercentage : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .gray
        button.setTitleColor(.black, for: .normal)
        button.setTitle("%", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    private lazy var buttonDivide : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.setTitle("÷", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    //MARK: - Stack 2
    
    private lazy var stackView2 : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var button7 : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("7", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var button8 : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("8", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var button9 : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("9", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var buttonMultiplaction : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.setTitle("X", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    
    //MARK: - Stack 3
    private lazy var stackView3 : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var button4 : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("4", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var button5 : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("5", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var button6 : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("6", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var buttonMinus : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.setTitle("-", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    //MARK: - Stack 4
    private lazy var stackView4 : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var button1 : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("1", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var button2 : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("2", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var button3 : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("3", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var buttonPlus : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.setTitle("+", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    
    //MARK: - Stack 5
    private lazy var stackView5 : UIStackView = {
        var stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    private lazy var button0 : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle("0", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var buttonComma : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .darkGray
        button.setTitleColor(.white, for: .normal)
        button.setTitle(",", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()
    private lazy var buttonEqual : UIButton = {
        var button = UIButton(type: .system)
        button.backgroundColor = .systemOrange
        button.setTitleColor(.white, for: .normal)
        button.setTitle("=", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        return button
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .black
        configuration()
    }
    
    func configuration() {
        configurationStack5()
        configurationStack4()
        configurationStack3()
        configurationStack2()
        configurationStack1()
    }
    
    func configurationStack1() {
        stackView1.addArrangedSubview(buttonAC)
        stackView1.addArrangedSubview(buttonChangeSign)
        stackView1.addArrangedSubview(buttonPercentage)
        stackView1.addArrangedSubview(buttonDivide)
        
        stackView1.spacing = 10
        view.addSubview(stackView1)
        stackView1.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView1.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView1.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView1.bottomAnchor.constraint(equalTo: stackView2.topAnchor, constant: -10),
            stackView1.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25, constant: -12.5)
        ])
    }
    
    func configurationStack2() {
        stackView2.addArrangedSubview(button7)
        stackView2.addArrangedSubview(button8)
        stackView2.addArrangedSubview(button9)
        stackView2.addArrangedSubview(buttonMultiplaction)
        stackView2.spacing = 10
        view.addSubview(stackView2)
        stackView2.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView2.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView2.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView2.bottomAnchor.constraint(equalTo: stackView3.topAnchor, constant: -10),
            stackView2.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25, constant: -12.5)
        ])
        
        
    }
    
    func configurationStack3() {
        stackView3.addArrangedSubview(button4)
        stackView3.addArrangedSubview(button5)
        stackView3.addArrangedSubview(button6)
        stackView3.addArrangedSubview(buttonMinus)
        stackView3.spacing = 10
        view.addSubview(stackView3)
        stackView3.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView3.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView3.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView3.bottomAnchor.constraint(equalTo: stackView4.topAnchor, constant: -10),
            stackView3.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25, constant: -12.5)
        ])
        
    }
    
    
    func configurationStack4() {
        stackView4.addArrangedSubview(button1)
        stackView4.addArrangedSubview(button2)
        stackView4.addArrangedSubview(button3)
        stackView4.addArrangedSubview(buttonPlus)
        stackView4.spacing = 10
        view.addSubview(stackView4)
        stackView4.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView4.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView4.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView4.bottomAnchor.constraint(equalTo: stackView5.topAnchor, constant: -10),
            stackView4.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25, constant: -12.5)
        ])
    }
    func configurationStack5(){
        let subStackView1 : UIStackView = UIStackView(arrangedSubviews: [button0])
        let subStackView2 : UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [buttonComma,buttonEqual])
            stackView.axis = .horizontal
            stackView.distribution = .fillEqually
            stackView.spacing = 10
            return stackView
        }()
        print(buttonAC.frame.size.width)

        stackView5.addArrangedSubview(subStackView1)
        stackView5.addArrangedSubview(subStackView2)
        stackView5.spacing = 10
        view.addSubview(stackView5)
        stackView5.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stackView5.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            stackView5.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView5.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            stackView5.heightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, multiplier: 0.25, constant: -10)
        ])
    }
    
    
    
}

#Preview(""){
    ViewController()

}
