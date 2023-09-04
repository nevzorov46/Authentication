//
//  Utils.swift
//  Authentication
//
//  Created by Иван Карамазов on 04.09.2023.
//

import UIKit

extension UIColor {
    static let mainBlue = UIColor(red: 0.016, green: 0.482, blue: 0.973, alpha: 1)
    static let borderColor = UIColor(red: 0.843, green: 0.843, blue: 0.843, alpha: 1)
    static let mainGrey = UIColor(red: 0.59, green: 0.59, blue: 0.59, alpha: 1)
}

extension UIFont {
    
    static func rbBold(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Bold", size: size) ?? UIFont.systemFont(ofSize: size, weight: .bold)
    }
    
    static func rbRegular(size: CGFloat) -> UIFont {
        return UIFont(name: "Roboto-Regular", size: size) ?? UIFont.systemFont(ofSize: size, weight: .regular)
    }
}
