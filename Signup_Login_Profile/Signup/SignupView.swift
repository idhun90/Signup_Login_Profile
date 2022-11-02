//
//  SignupView.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import UIKit

import SnapKit

final class SignupView: BaseView {
    
    private let userNameTextField: CustomTextField = {
        let view = CustomTextField()
        view.setup(placeholder: "이름을 입력하세요.", keyboardType: .default, secureText: false)
        return view
    }()
    
    private let emailTextField: CustomTextField = {
       let view = CustomTextField()
        view.setup(placeholder: "이메일을 입력하세요.", keyboardType: .emailAddress, secureText: false)
        return view
    }()
    
    private let passwordTextField: CustomTextField = {
        let view = CustomTextField()
        view.setup(placeholder: "비밀번호를 입력하세요.", keyboardType: .default, secureText: true)
        return view
    }()
    
    let signupButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "회원가입"
        let view = UIButton(configuration: configuration)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setupUI() {
        
        self.backgroundColor = .systemBackground
        
        [userNameTextField, emailTextField, passwordTextField, signupButton].forEach {
            self.addSubview($0)
        }
        
    }
    
    override func setupConstraints() {
        
        let spacing = 20
        let height = 44
        
        userNameTextField.snp.makeConstraints {
            $0.top.leading.equalTo(self.safeAreaLayoutGuide).offset(spacing)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).offset(-spacing)
            $0.height.equalTo(height)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(userNameTextField.snp.bottom).offset(spacing)
            $0.leading.equalTo(self.safeAreaLayoutGuide).offset(spacing)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).offset(-spacing)
            $0.height.equalTo(height)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField.snp.bottom).offset(spacing)
            $0.leading.equalTo(self.safeAreaLayoutGuide).offset(spacing)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).offset(-spacing)
            $0.height.equalTo(height)
        }
        
        signupButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField.snp.bottom).offset(spacing)
            $0.leading.equalTo(self.safeAreaLayoutGuide).offset(spacing)
            $0.trailing.equalTo(self.safeAreaLayoutGuide).offset(-spacing)
            $0.height.equalTo(height)
        }
        
    }
}
