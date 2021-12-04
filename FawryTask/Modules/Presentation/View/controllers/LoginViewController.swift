//
//  LoginViewController.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 03/12/2021.
//

import UIKit

class LoginViewController: BaseViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var errorMessageView: UIView!
    
    // MARK: - Controller Variables
    private var viewModel: LoginViewModel!
    override func viewDidLoad() {
        viewModel = LoginViewModel(loginRepository: OfflineLoginRepository())
        super.viewDidLoad()
        errorMessageView.isHidden = true
    }
    
    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: UIButton) {
//        viewModel.login(email: emailTextField.text ?? "" , password: passwordTextField.text ?? "")
        
        let newViewController = NewsViewController()
        newViewController.modalPresentationStyle = .overFullScreen
        self.present(newViewController, animated: true, completion: nil)
    }
    
    @IBAction func didPressSignupButton(_ sender: UIButton) {
        let regViewController = RegistrationViewController()
        self.navigationController?.pushViewController(regViewController, animated: true)
    }
    
    override func observeBindables() {
        
        disposeBag.add(viewModel.validationError.bind({ [weak self] errorMessage in
            guard let self = self else {
                return
            }
            guard let errorMessage = errorMessage else {
                self.errorMessageView.isHidden = true
                return
            }
            self.errorMessageView.isHidden = false
            self.errorMessageLabel.text = errorMessage
        }))
        
        disposeBag.add(viewModel.loginSuccessfully.bind({ [weak self] navigateToHome in
            guard let self = self else {
                return
            }
            if navigateToHome {
                
            }else {
                
            }
        }))
    }
}
