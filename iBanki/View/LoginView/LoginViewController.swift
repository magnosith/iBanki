//
//  LoginViewController.swift
//  iBanki
//
//  Created by Mauro Magno on 05/06/24.
//

import UIKit
import SwiftUI

class LoginViewController: UIViewController {
    
    //MARK: PROPERTIES
    
    let loginView = LoginView()
    var username: String? {
        return loginView.getUsername()
    }
    
    var password: String? {
        return loginView.getPassword()
    }
    
    private var errorMessageLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        label.textColor = .systemRed
        label.numberOfLines = 0
        label.text = "Error failure to sign in"
        label.isHidden = true
        return label
    }()
    
    private let signButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.configuration = .filled()
        button.configuration?.imagePadding = 8
        button.setTitle("Sign In", for: .normal)
        button.backgroundColor = .blueiBanki
        button.addTarget(LoginViewController.self, action: #selector(signInTappedLogin), for: .touchUpInside)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        return button
    }()
    
    private let logoImageView: UIImageView = {
        let image = UIImageView(image: UIImage(named: "logo-ibanki"))
        image.contentMode = .scaleAspectFill
        image.translatesAutoresizingMaskIntoConstraints = false
       return image
    }()
    
    private let subtitleLabel: UILabel = {
        let subtitle = UILabel()
        subtitle.translatesAutoresizingMaskIntoConstraints = false
        subtitle.textAlignment = .center
        subtitle.textColor = .systemGray
        subtitle.text = "Everything that you need in a bank, you will find here!"
        subtitle.lineBreakMode = .byWordWrapping
        subtitle.numberOfLines = 3
        return subtitle
    }()
    
    //MARK: LIFECICLE
    override func viewDidLoad(){
        super.viewDidLoad()
        setupUI()
        setupLayout()
    }
    
    // MARK: - SELECTORS
    
    @objc func signInTappedLogin(){
        errorMessageLabel.isHidden = true
        dataLoginCheck()
    }
    
    private func dataLoginCheck() {
        guard let username = username, let password = password else {
            assertionFailure("Username / Password should never be nil")
            return
        }
        
        if username.isEmpty || password.isEmpty {
            configureView(withMessage: "Username / Password cannot be blank")
            return
        }
        
        if username == "Kelvin" && password == "Welcome" {
            signButton.configuration?.showsActivityIndicator = true
        } else {
            configureView(withMessage: "Incorrect Username or Password")
        }
    }
    private func configureView(withMessage message: String){
        errorMessageLabel.isHidden = false
        errorMessageLabel.text = message
    }
    
}



extension LoginViewController {
    
    //MARK: HELPERS
    
    func setupUI () {
        view.addSubview(logoImageView)
        view.addSubview(subtitleLabel)
        view.addSubview(loginView)
        view.addSubview(signButton)
        view.addSubview(errorMessageLabel)
        
    }
    
        func setupLayout(){
            loginView.translatesAutoresizingMaskIntoConstraints = false
    
            //ImageLogoView
                  NSLayoutConstraint.activate([
                      logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
                      logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                      logoImageView.heightAnchor.constraint(equalToConstant: 40)
                  ])
    
                NSLayoutConstraint.activate([
                    subtitleLabel.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 30),
                    subtitleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                    subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
                ])
    
                  // LoginView
                  NSLayoutConstraint.activate([
                      loginView.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor, constant: 30),
                      loginView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                      loginView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
                  ])
    
                  // Button SignIn
                  NSLayoutConstraint.activate([
                      signButton.topAnchor.constraint(equalTo: loginView.bottomAnchor, constant: 20),
                      signButton.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
                      signButton.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
                  ])
    
                  // Error Label
                  NSLayoutConstraint.activate([
                      errorMessageLabel.topAnchor.constraint(equalTo: signButton.bottomAnchor, constant: 20),
                      errorMessageLabel.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
                      errorMessageLabel.trailingAnchor.constraint(equalTo: loginView.trailingAnchor)
                  ])
    
        }
}

#if DEBUG
import SwiftUI

struct LoginViewController_Previews: PreviewProvider {
    static var previews: some View {
        CustomUIViewControllerPreview {
            let loginViewController = LoginViewController()
            return loginViewController
        }
        .edgesIgnoringSafeArea(.all)
    }
}

struct CustomUIViewControllerPreview<ViewController: UIViewController>: UIViewControllerRepresentable {
    let viewController: ViewController

    init(_ builder: @escaping () -> ViewController) {
        self.viewController = builder()
    }

    func makeUIViewController(context: Context) -> ViewController {
        return viewController
    }

    func updateUIViewController(_ uiViewController: ViewController, context: Context) {}
}
#endif
