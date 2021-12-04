//
//  RegistrationViewController.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import UIKit

class RegistrationViewController: UIViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var errorMessageView: UIView!
    
    var registrationViewModel: RegistrationViewModel!
    var disposeBag = DisposableBag()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        errorMessageView.isHidden = true
        registrationViewModel = RegistrationViewModel(repoistory: OfflineRegisrtaionRepoistory())
        observeBindables()
        passwordTextField.autocorrectionType = .no
        confirmPasswordTextField.autocorrectionType = .no
    }
    
    // MARK: - Actions
    @IBAction func didPressNextStepButton(_ sender: UIButton) {
        registrationViewModel.signUp(email: usernameTextField.text ?? "", password: passwordTextField.text ?? "" , confirmPassword: confirmPasswordTextField.text ?? "")
    }
    
    func observeBindables() {
        disposeBag.add(registrationViewModel.validationError.bind({ [weak self] errorMessage in
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
    }
    
    @IBAction func showHidePasswordButtonAction(sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        sender.isSelected = !passwordTextField.isSecureTextEntry
    }
    
    @IBAction func showHideConfirmButtonAction(sender: UIButton) {
        confirmPasswordTextField.isSecureTextEntry = !confirmPasswordTextField.isSecureTextEntry
        sender.isSelected = !confirmPasswordTextField.isSecureTextEntry
    }
}
