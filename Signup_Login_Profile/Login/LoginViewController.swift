//
//  LoginViewController.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import UIKit

import Alamofire

struct Login: Codable {
    let token: String
}

final class LoginViewController: BaseViewController {
    
    private let mainView = LoginView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.mainView.loginButton.addTarget(self, action: #selector(login), for: .touchUpInside)
    }
    
    override func setupUI() {
        title = "로그인"
    }
    
    private func goToProfile() {
        let vc = ProfileViewController()
        transitionViewController(viewController: vc, style: .push, animated: true)
    }
    
    @objc private func login() {
        
        guard let email = self.mainView.emailTextField.text else { return }
        guard let password = self.mainView.passwordTextField.text else { return }
        
        let api = SeSACAPI.login(email: email, password: password)
        AF.request(api.url, method: .post, parameters: api.parameters, headers: api.headers).responseDecodable(of: Login.self) { [weak self] response in
            switch response.result {
                
            case .success(let data):
                print(data.token)
                UserDefaults.standard.set(data.token, forKey: "token")
                self?.goToProfile()
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
        
    }

}
