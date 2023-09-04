//
//  ViewController.swift
//  Authentication
//
//  Created by Иван Карамазов on 04.05.2021.
//

import UIKit
import JMMaskTextField_Swift

class ViewController: UIViewController {
    
    private let mainImage = UIImageView()
    private let bottomText = UILabel()
    private let countryCode = UILabel()
    private let continueButton = UIButton()
    private let devidingLine = UIView()
    private let textField = JMMaskTextField()
    private var keyboardHeight: CGFloat?
    private var bottomContraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
        view.backgroundColor = UIColor.mainBlue
        setupView()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    

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
        bottomText.font = .rbRegular(size: 10)
        bottomText.numberOfLines = 0
        bottomContraint = bottomText.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15)
        NSLayoutConstraint.activate([
            bottomContraint!,
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
        countryCode.font = .rbBold(size: 24)
        NSLayoutConstraint.activate([
            countryCode.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            devidingLine.topAnchor.constraint(equalTo: countryCode.bottomAnchor, constant: 8),
            countryCode.heightAnchor.constraint(equalToConstant: 24),
            countryCode.widthAnchor.constraint(equalToConstant: 27)
        ])
    }
    
    private func setupTextField() {
        view.addSubview(textField)
        textField.keyboardType = .numberPad
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.maskString = "000-000-00-00"
        textField.textColor = .white
        textField.font = .rbBold(size: 24)
        textField.attributedPlaceholder = NSAttributedString(string: "Введите номер телефона", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white, NSAttributedString.Key.font: UIFont.rbRegular(size: 12)])
        
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

    private func validate(value: String) -> Bool {
        let PHONE_REGEX = "^\\d{3}-\\d{3}-\\d{4}$"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", PHONE_REGEX)
        let result = phoneTest.evaluate(with: value)
        return result
    }
    
    @objc func buttonAction() {
        let secondVc = SecondViewController()
        navigationController?.pushViewController(secondVc, animated: true)
    }
    
    @objc func dismissKeyboard() {
        textField.endEditing(true)
    }
    
    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            self.keyboardHeight = keyboardRectangle.height
            self.continueButton.isHidden = true
            self.bottomText.isHidden = true
            if bottomContraint.constant == -15 {
                bottomContraint.constant = bottomContraint.constant + self.keyboardHeight! - 500
            }
        }
    }
    
    @objc func keyboardWillHide(notification: Notification) {
        self.continueButton.isHidden = false
        self.bottomText.isHidden = false
        bottomContraint.constant = -15
    }

}
