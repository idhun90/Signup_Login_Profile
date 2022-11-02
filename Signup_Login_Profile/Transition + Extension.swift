//
//  TransitionViewController.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import UIKit

extension UIViewController {
    
    enum TransitionStyle {
        case push
    }
    
    enum unwindStyle {
        case pop
    }
    
    func transitionViewController<T: UIViewController>(viewController: T, style: TransitionStyle, animated: Bool) {
        switch style {
        case .push:
            self.navigationController?.pushViewController(viewController, animated: animated)
        }
    }
    
    func unwind(style: unwindStyle) {
        switch style {
        case .pop:
            self.navigationController?.popViewController(animated: true)
        }
    }
}

