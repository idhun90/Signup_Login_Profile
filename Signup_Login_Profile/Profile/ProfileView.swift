//
//  ProfileView.swift
//  Signup_Login_Profile
//
//  Created by 도헌 on 2022/11/02.
//

import UIKit

import SnapKit

final class ProfileView: BaseView {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFill
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()
    
    let userNameLabel: UILabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 20, weight: .bold)
        view.sizeToFit()
        return view
    }()
    
    let logoutButton: UIButton = {
        var configuration = UIButton.Configuration.filled()
        configuration.title = "로그아웃"
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
        self.addSubview(imageView)
        self.addSubview(userNameLabel)
        self.addSubview(logoutButton)
    }
    
    override func setupConstraints() {
        
        let spacing = 20
        let height = 44
        
        imageView.snp.makeConstraints {
            $0.centerX.equalTo(self.safeAreaLayoutGuide)
            $0.width.height.equalTo(100)
            $0.top.equalTo(self.safeAreaLayoutGuide.snp.top).offset(spacing)
        }
        
        userNameLabel.snp.makeConstraints {
            $0.centerX.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(height)
            $0.top.equalTo(imageView.snp.bottom).offset(spacing)
        }
        
        logoutButton.snp.makeConstraints {
            $0.center.equalTo(self.safeAreaLayoutGuide)
            $0.leading.equalTo(self.safeAreaLayoutGuide.snp.leading).offset(spacing)
            $0.trailing.equalTo(self.safeAreaLayoutGuide.snp.trailing).offset(-spacing)
            $0.height.equalTo(height)
        }
    }
}
