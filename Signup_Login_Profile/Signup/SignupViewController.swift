//
//  SignupViewController.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import Foundation
import UIKit

final class SignupViewController: BaseViewController {
    
    private let mainView = SignupView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func setupUI() {
        title = "회원가입"
    }
}
