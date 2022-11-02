//
//  ProfileViewController.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import UIKit

import Alamofire

struct Profile: Codable {
    let user: User
}

struct User: Codable {
    let photo: String
    let email: String
    let username: String
}

final class ProfileViewController: BaseViewController {
    
    private let mainView = ProfileView()
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profile()
        
        self.mainView.logoutButton.addTarget(self, action: #selector(logout), for: .touchUpInside)
    }
    
    override func setupUI() {
        title = "프로필"
    }
    
    @objc private func logout() {
        UserDefaults.standard.removeObject(forKey: "token")
        
        let windowsScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate = windowsScene?.delegate as? SceneDelegate
        
        let vc = SignupViewController()
        let nvc = UINavigationController(rootViewController: vc)
        
        sceneDelegate?.window?.rootViewController = nvc
        sceneDelegate?.window?.makeKeyAndVisible()
    }
    
    private func profile() {
        
        let api = SeSACAPI.profile
        
        AF.request(api.url, method: .get, headers: api.headers).responseDecodable(of: Profile.self) { response in
            switch response.result {
            case .success(let data):
                // 동기 비동기로 이미지 처리해야 할 것 같은데 일단 보류,,
                //                    let url = URL(string: data.user.photo)
                //                    let photoData = try Data(contentsOf: url!)
                //
                //                    DispatchQueue.main.async {
                //                        self.mainView.imageView.image = UIImage(data: photoData)
                //                    }
                
                self.mainView.userNameLabel.text = data.user.username
            case .failure(_):
                print(response.response?.statusCode)
            }
        }
        
    }
}
