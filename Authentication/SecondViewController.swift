//
//  SecondViewController.swift
//  Authentication
//
//  Created by Иван Карамазов on 13.08.2021.
//

import UIKit

class SecondViewController: UIViewController {

    let readyButton = UIButton()
    let SMSInfo = UILabel()
    let horizontalStack = UIStackView()
    let topText = UILabel()
    

    private func setupReadyButton() {
        view.addSubview(readyButton)
        readyButton.translatesAutoresizingMaskIntoConstraints = false
        readyButton.setTitleColor(.white, for: .normal)
        readyButton.setTitle("Готово", for: .normal)
        readyButton.layer.cornerRadius = 15
        readyButton.backgroundColor = UIColor.mainBlue
        
        NSLayoutConstraint.activate([
           readyButton.heightAnchor.constraint(equalToConstant: 57),
           readyButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
           view.trailingAnchor.constraint(equalTo: readyButton.trailingAnchor, constant: 10),
           view.bottomAnchor.constraint(equalTo: readyButton.bottomAnchor, constant: 12)
        ])
    }
    
    
    private func setupTopText() {
        view.addSubview(topText)
        topText.translatesAutoresizingMaskIntoConstraints = false
        topText.font = UIFont(name: "Roboto-Bold", size: 24)
        topText.text = "Введите код из СМС"
        topText.textColor = .black
        
        NSLayoutConstraint.activate([
            topText.topAnchor.constraint(equalTo: view.topAnchor, constant: 108),
            topText.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 38)
        ])
  
    }
    
    
    private func setupStackView() {
        view.addSubview(horizontalStack)
        horizontalStack.translatesAutoresizingMaskIntoConstraints = false
        horizontalStack.alignment = .fill
        horizontalStack.distribution = .fill
        horizontalStack.spacing = 14
        horizontalStack.axis = .horizontal
    
        NSLayoutConstraint.activate([
            horizontalStack.topAnchor.constraint(equalTo: topText.bottomAnchor, constant: 24),
            horizontalStack.leadingAnchor.constraint(equalTo: topText.leadingAnchor)
        ])
        
        let count = 4
        for _ in 1...count {
            setupTextField()
        }
    }
    
    private func setupTextField() {

        let textField = UITextField()
        textField.layer.cornerRadius = 10
        textField.tintColor = .black
        textField.layer.borderWidth = 1
        
        let borderColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 1).cgColor
        textField.layer.borderColor = borderColor
        horizontalStack.addArrangedSubview(textField)
        NSLayoutConstraint.activate([
            textField.widthAnchor.constraint(equalToConstant: 64),
            textField.heightAnchor.constraint(equalToConstant: 64)
        ])

    }
    
    private func setupSMSInfo() {
        view.addSubview(SMSInfo)
        SMSInfo.translatesAutoresizingMaskIntoConstraints = false
        SMSInfo.font = UIFont(name: "Roboto-Regular", size: 14)
        SMSInfo.text = "Повторно отправить СМС с кодом можно будет через 15 секунд"
        SMSInfo.textColor = UIColor(red: 151/255, green: 151/255, blue: 151/255, alpha: 1)
        SMSInfo.numberOfLines = 0
        SMSInfo.textAlignment = .center
        NSLayoutConstraint.activate([
            SMSInfo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            SMSInfo.topAnchor.constraint(equalTo: horizontalStack.bottomAnchor, constant: 60),
            SMSInfo.widthAnchor.constraint(equalToConstant: 315)
        ])
 
    }

    private func setupView() {
        setupReadyButton()
        setupTopText()
        setupStackView()
        setupSMSInfo()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupView()
    }

}
