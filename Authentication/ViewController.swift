//
//  ViewController.swift
//  Authentication
//
//  Created by Иван Карамазов on 04.05.2021.
//

import UIKit
import JMMaskTextField_Swift

class ViewController: UIViewController {
    
    var mainImage = UIImageView()
    var bottomText = UILabel()
    var countryCode = UILabel()
    var continueButton = UIButton()
    var devidingLine = UIView()
    var textField = JMMaskTextField()

    private func setupImage() {
        view.addSubview(mainImage)
        mainImage.translatesAutoresizingMaskIntoConstraints = false
        mainImage.image = UIImage(named: "xc")
        NSLayoutConstraint.activate([
            mainImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainImage.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100)
        ])
    }
    
    private func setupBottomText() {
        view.addSubview(bottomText)
        bottomText.translatesAutoresizingMaskIntoConstraints = false
        bottomText.text = "Ознакомтесь с договором аренды. Регистрируясь или авторизуясь, вы принимаете его условия"
        bottomText.textColor = .white
        bottomText.textAlignment = .center
        bottomText.font = UIFont(name: "Roboto-Regular", size: 10)
        bottomText.numberOfLines = 0
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: bottomText.bottomAnchor, constant: 15),
            bottomText.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            bottomText.widthAnchor.constraint(equalToConstant: 256)
        ])
    }

    private func setupContinueButton() {
        view.addSubview(continueButton)
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        continueButton.setTitleColor(UIColor.mainBlue, for: .normal)
        continueButton.setTitle("Продолжить", for: .normal)
        continueButton.layer.cornerRadius = 15
        continueButton.backgroundColor = .white
        NSLayoutConstraint.activate([
            continueButton.heightAnchor.constraint(equalToConstant: 57),
            continueButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            view.trailingAnchor.constraint(equalTo: continueButton.trailingAnchor, constant: 10),
            bottomText.topAnchor.constraint(equalTo: continueButton.bottomAnchor, constant: 14)
        ])
        
        continueButton.addTarget(self, action: #selector(buttonAction), for: .touchUpInside )
        
    }
    
    private func setupDevidingLine() {
        view.addSubview(devidingLine)
        devidingLine.translatesAutoresizingMaskIntoConstraints = false
        devidingLine.backgroundColor = .white
        NSLayoutConstraint.activate([
            devidingLine.heightAnchor.constraint(equalToConstant: 1),
            view.trailingAnchor.constraint(equalTo: devidingLine.trailingAnchor, constant: 31),
            devidingLine.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 31),
            continueButton.topAnchor.constraint(equalTo: devidingLine.bottomAnchor, constant: 49)
   
        ])
    }
    
    private func setupCountryCode() {
        view.addSubview(countryCode)
        countryCode.translatesAutoresizingMaskIntoConstraints = false
        countryCode.textColor = .white
        countryCode.text = "+7"
        countryCode.font = UIFont(name: "Roboto-Bold", size: 24)
        NSLayoutConstraint.activate([
            countryCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            devidingLine.topAnchor.constraint(equalTo: countryCode.bottomAnchor, constant: 8),
            countryCode.heightAnchor.constraint(equalToConstant: 24),
            countryCode.widthAnchor.constraint(equalToConstant: 27)
        
        ])
    }
    
    private func setupTextField() {
        view.addSubview(textField)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.maskString = "000-000-00-00"
        textField.textColor = .white
        textField.font = UIFont(name: "Roboto-Bold", size: 24)
        textField.attributedPlaceholder = NSAttributedString(string: "Введите номер телефона", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont(name: "Roboto-Regular", size: 12) ?? UIFont.systemFont(ofSize: 12)])
        
        NSLayoutConstraint.activate([
            textField.leadingAnchor.constraint(equalTo: countryCode.trailingAnchor, constant: 15),
            devidingLine.topAnchor.constraint(equalTo: textField.bottomAnchor, constant: 4)
 
        ])
    }
    
    
    private func setupView() {
      setupImage()
      setupBottomText()
      setupContinueButton()
      setupDevidingLine()
      setupCountryCode()
      setupTextField()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.mainBlue
        setupView()
        self.title = "Authentication"
    }

    @objc func buttonAction() {
        //print("Button pressed")
        let secondVc = SecondViewController()
        navigationController?.pushViewController(secondVc, animated: true)
    }

}

extension UIColor {
    static var mainBlue = UIColor(red: 0.016, green: 0.482, blue: 0.973, alpha: 1)
}
