//
//  CustomTextField.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import UIKit

class CustomTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(placeholder: String, keyboardType: UIKeyboardType, secureText: Bool) {
        self.placeholder = placeholder
        self.autocapitalizationType = .none
        self.keyboardType = keyboardType
        self.isSecureTextEntry = secureText
        
        self.clearButtonMode = .always
        
        self.layer.borderWidth = 1
        self.layer.borderColor = UIColor.systemGray6.cgColor
        
        self.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 0))
        self.leftViewMode = .always
    }
}
