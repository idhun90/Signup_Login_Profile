//
//  SignupViewController.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import UIKit

final class SignupViewController: BaseViewController {
    
    private let mainView = SignupView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.signupButton.addTarget(self, action: #selector(goToLogin), for: .touchUpInside)
        
    }
    
    override func setupUI() {
        title = "회원가입"
    }
    
    @objc private func goToLogin() {
        let vc = LoginViewController()
        transitionViewController(viewController: vc, style: .push, animated: true)
    }
}
