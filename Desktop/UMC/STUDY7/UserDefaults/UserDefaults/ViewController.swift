//
//  ViewController.swift
//  UserDefaults
//
//  Created by 최영우 on 5/19/23.
//

import UIKit

class ViewController: UIViewController {
    
    private var LoginLabel : UILabel = {
        let loginlabel = UILabel()
        loginlabel.text = "ID"
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
        passwordlabel.text = "PassWord"
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
    
    
    private var LoginButton : UIButton = {
        let button = UIButton()
        button.setTitle("로그인", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private var Register : UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.systemOrange, for: .normal)
        button.setTitleColor(.orange, for: .highlighted)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(self.LoginLabel)
        self.view.addSubview(self.Login)
        self.view.addSubview(self.passwordLabel)
        self.view.addSubview(self.Password)
        self.view.addSubview(self.LoginButton)
        self.view.addSubview(self.Register)
        
        Register.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)

        
        NSLayoutConstraint.activate ([
            self.LoginLabel.heightAnchor.constraint(equalToConstant: 30),
            self.LoginLabel.widthAnchor.constraint(equalToConstant: 30),
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
            self.passwordLabel.widthAnchor.constraint(equalToConstant: 80),
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
            self.LoginButton.heightAnchor.constraint(equalToConstant: 30),
            self.LoginButton.widthAnchor.constraint(equalToConstant: 60),
            self.LoginButton.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 400),
            self.LoginButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
        
        NSLayoutConstraint.activate ([
            self.Register.heightAnchor.constraint(equalToConstant: 30),
            self.Register.widthAnchor.constraint(equalToConstant: 80),
            self.Register.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 450),
            self.Register.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
        ])
    }
    
    
    @objc private func registerButtonTapped() {
        let registerViewController = RegisterViewController()
        self.present(registerViewController, animated: true)
    }
    
    @objc private func loginButtonTapped() {
            guard let enteredID = Login.text, let enteredPassword = Password.text else {
                // Handle case when ID or password is not entered
                return
            }
            
            // Retrieve stored ID and password from UserDefaults
            let storedID = UserDefaults.standard.string(forKey: "id")
            let storedPassword = UserDefaults.standard.string(forKey: "password")
            
            if enteredID == storedID && enteredPassword == storedPassword {
                // Correct ID and password
                print("Login successful!")
            } else {
                // Incorrect ID or password
                print("Incorrect ID or password!")
            }
        }
    
    
  
    
    


}
