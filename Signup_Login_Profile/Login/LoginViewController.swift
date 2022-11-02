//
//  LoginViewController.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import UIKit

final class LoginViewController: BaseViewController {
    
    private let mainView = LoginView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.loginButton.addTarget(self, action: #selector(goToProfile), for: .touchUpInside)
    }
    
    override func setupUI() {
        title = "로그인"
    }
    
    @objc private func goToProfile() {
        let vc = ProfileViewController()
        transitionViewController(viewController: vc, style: .push, animated: true)
    }

}
