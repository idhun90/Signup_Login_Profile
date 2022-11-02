//
//  SignupView.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import Foundation
import UIKit

final class SignupView: BaseView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI() {
        self.backgroundColor = .systemBackground
    }
    
    override func setupConstraints() { }
}