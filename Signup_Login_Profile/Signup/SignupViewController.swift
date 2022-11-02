//
//  SignupViewController.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import UIKit

import Alamofire

final class SignupViewController: BaseViewController {
    
    private let mainView = SignupView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.signupButton.addTarget(self, action: #selector(signup), for: .touchUpInside)
        
    }
    
    override func setupUI() {
        title = "회원가입"
    }
    
    private func goToLogin() {
        let vc = LoginViewController()
        transitionViewController(viewController: vc, style: .push, animated: true)
    }
    
    @objc private func signup() {
        
        guard let userName = self.mainView.userNameTextField.text else { return }
        guard let email = self.mainView.emailTextField.text else { return }
        guard let password = self.mainView.passwordTextField.text else { return }
        
        let api = SeSACAPI.signup(userName: userName, email: email, password: password)
        AF.request(api.url, method: .post, parameters: api.parameters ,headers: api.headers).responseString { [weak self] response in
            switch response.result {
            case .success(_):
                print(response)
                self?.goToLogin()
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
    }
}
