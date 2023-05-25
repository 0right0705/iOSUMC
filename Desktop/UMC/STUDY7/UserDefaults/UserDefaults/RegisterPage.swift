//
//  RegisterPage.swift
//  UserDefaults
//
//  Created by 최영우 on 5/25/23.
//

import Foundation
import UIKit

class RegisterViewController : UIViewController {
    
    
    private var LoginLabel : UILabel = {
        let loginlabel = UILabel()
        loginlabel.text = "사용할 ID"
        loginlabel.textColor = .black
        loginlabel.translatesAutoresizingMaskIntoConstraints = false
        return loginlabel
    }()
    
    private var Login : UITextView = {
        let login = UITextView()
        login.layer.borderWidth = 1.0
        login.layer.borderColor = UIColor.black.cgColor
        login.textColor = .black
        login.translatesAutoresizingMaskIntoConstraints = false
        return login
    }()
    
    private var passwordLabel : UILabel = {
        let passwordlabel = UILabel()
        passwordlabel.text = "사용할 PassWord"
        passwordlabel.textColor = .black
        passwordlabel.translatesAutoresizingMaskIntoConstraints = false
        return passwordlabel
    }()
    
    private var Password : UITextView = {
        let password = UITextView()
        password.layer.borderWidth = 1.0
        password.layer.borderColor = UIColor.black.cgColor
        password.textColor = .black
        password.translatesAutoresizingMaskIntoConstraints = false
        return password
    }()
    
    private var Register : UIButton = {
        let button = UIButton()
        button.setTitle("완료", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.setTitleColor(.orange, for: .highlighted)
        button
            .addTarget(self, action: #selector(saveIdAndPasswordInUserDefaults), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        
        self.view.addSubview(self.LoginLabel)
        self.view.addSubview(self.Login)
        self.view.addSubview(self.passwordLabel)
        self.view.addSubview(self.Password)
        self.view.addSubview(self.Register)
        
        NSLayoutConstraint.activate ([
            self.LoginLabel.heightAnchor.constraint(equalToConstant: 30),
            self.LoginLabel.widthAnchor.constraint(equalToConstant: 70),
            self.LoginLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 200),
            self.LoginLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate ([
            self.Login.heightAnchor.constraint(equalToConstant: 30),
            self.Login.widthAnchor.constraint(equalToConstant: 180),
            self.Login.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 250),
            self.Login.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate ([
            self.passwordLabel.heightAnchor.constraint(equalToConstant: 30),
            self.passwordLabel.widthAnchor.constraint(equalToConstant: 140),
            self.passwordLabel.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 300),
            self.passwordLabel.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate ([
            self.Password.heightAnchor.constraint(equalToConstant: 30),
            self.Password.widthAnchor.constraint(equalToConstant: 180),
            self.Password.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 350),
            self.Password.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate ([
            self.Register.heightAnchor.constraint(equalToConstant: 30),
            self.Register.widthAnchor.constraint(equalToConstant: 80),
            self.Register.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
            self.Register.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
    
    @objc func saveIdAndPasswordInUserDefaults() {
        guard let id = Login.text else { return }
        guard let password = Password.text else { return }
            
        UserDefaults.standard.setValue(id, forKey: "id")
        UserDefaults.standard.setValue(password, forKey: "password")
    }

    
    @objc private func didTapButton() {
        saveIdAndPasswordInUserDefaults()
        self.dismiss(animated: true, completion: nil)
    }

    
}
