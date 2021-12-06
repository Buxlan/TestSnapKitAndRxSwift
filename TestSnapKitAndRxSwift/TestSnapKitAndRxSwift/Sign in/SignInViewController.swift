//
//  SignInViewController.swift
//  TestSnapKitAndRxSwift
//
//  Created by  Buxlan on 12/5/21.
//

import SnapKit
import RxSwift
import RxCocoa

class SignInViewController: UIViewController {
    
    // MARK: - Properties
    
    let viewModel = SignInViewModel()
    
    private lazy var loginTextField: UITextField = {
        let view = UITextField()
        view.accessibilityIdentifier = "loginTextField"
        view.placeholder = "Input Login here"
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardAppearance = .dark
        view.keyboardType = .numberPad
        view.backgroundColor = Colors.Gray.ultraLight
        return view
    }()
    
    private lazy var passwordTextField: UITextField = {
        let view = UITextField()
        view.accessibilityIdentifier = "passwordTextField"
        view.placeholder = "Input password here"
        view.textAlignment = .left
        view.translatesAutoresizingMaskIntoConstraints = false
        view.keyboardAppearance = .dark
        view.keyboardType = .numberPad
        view.backgroundColor = Colors.Gray.ultraLight
        return view
    }()
    
    private lazy var signInButton: UIButton = {
        let view = UIButton()
        view.setTitle("Sign in", for: .normal)
        view.backgroundColor = .systemBlue
        view.setTitleColor(.white, for: .normal)
        view.layer.borderWidth = 0.5
        view.layer.cornerRadius = 8
        view.contentEdgeInsets = .init(top: 8, left: 12, bottom: 8, right: 12)
        return view
    }()
    
    // MARK: - Lifecircle

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        configureViewModel()
    }

}

// MARK: - Helper methods

extension SignInViewController {
    
    private func configureViewModel() {
        loginTextField.rx.text
            .map { $0 ?? ""}
            .bind(to: viewModel.loginBehaviorRelay)
            .disposed(by: viewModel.disposeBag)
        passwordTextField.rx.text
            .map { $0 ?? ""}
            .bind(to: viewModel.passwordBehaviorRelay)
            .disposed(by: viewModel.disposeBag)
        signInButton.rx.tap.bind {
            print("button tapped")
        }.disposed(by: viewModel.disposeBag)
        viewModel.isValid()
            .bind(to: signInButton.rx.isEnabled)
            .disposed(by: viewModel.disposeBag)
    }
    
    private func configureUI() {
        view.backgroundColor = .white
        view.addSubview(loginTextField)
        view.addSubview(passwordTextField)
        view.addSubview(signInButton)
        configureConstraints()        
    }
    
    private func configureConstraints() {
        
        loginTextField.snp.makeConstraints { make in
            make.bottom.equalTo(view.layoutMarginsGuide.snp.centerY).offset(-8)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.layoutMarginsGuide.snp.width).offset(-32)
            make.height.equalTo(36)
        }
        
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(view.layoutMarginsGuide.snp.centerY).offset(8)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.layoutMarginsGuide.snp.width).offset(-32)
            make.height.equalTo(36)
        }
        
        signInButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(16)
            make.centerX.equalTo(view.snp.centerX)
        }
        
    }
    
}


