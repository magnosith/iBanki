//
//  LoginView.swift
//  iBanki
//
//  Created by Mauro Magno on 05/06/24.
//

import UIKit

class LoginView: UIView {
    
    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    private let username: UITextField = {
        let usernameTextField = UITextField()
        usernameTextField.translatesAutoresizingMaskIntoConstraints = false
        usernameTextField.placeholder = "Username"
        return usernameTextField
    }()
    
    private let password: UITextField = {
        let passwordTextField = UITextField()
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.placeholder = "Password"
        passwordTextField.isSecureTextEntry = true
        return passwordTextField
    }()
    
    private var divideView: UIView = {
        let dividerView = UIView()
        dividerView.translatesAutoresizingMaskIntoConstraints = false
        dividerView.backgroundColor = .secondarySystemFill
        return dividerView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        password.delegate = self
        setupUI()
        setupLayout()
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func getUsername() -> String? {
        return username.text
    }
    
    func getPassword() -> String? {
        return password.text
    }
    
  
}

extension LoginView {
    func setupUI(){
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .secondarySystemBackground
        
        
        
    }
    func setupLayout(){
        
        addSubview(stackView)
        stackView.addArrangedSubview(username)
        stackView.addArrangedSubview(divideView)
        stackView.addArrangedSubview(password)
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalToSystemSpacingBelow: topAnchor, multiplier: 1),
            stackView.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 1),
            trailingAnchor.constraint(equalToSystemSpacingAfter: stackView.trailingAnchor, multiplier: 1),
            bottomAnchor.constraint(equalToSystemSpacingBelow: stackView.bottomAnchor, multiplier: 1)
        ])
        
        divideView.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        layer.cornerRadius = 10
        clipsToBounds = true
    }
}

// MARK: UITextFieldDelegate
extension LoginView: UITextFieldDelegate {
    
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        username.endEditing(true)
        password.endEditing(true)

        return true
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        if textField.text != "" {
            return true
        } else {
            return false
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
       
    }
    
}

