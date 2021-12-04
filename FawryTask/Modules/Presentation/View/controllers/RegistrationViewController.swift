//
//  RegistrationViewController.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import UIKit

class RegistrationViewController: BaseViewController {
    
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPasswordTextField: UITextField!

    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var errorMessageView: UIView!
    
    var registrationViewModel: RegistrationViewModel!

    
    override func viewDidLoad() {
        registrationViewModel = RegistrationViewModel(repoistory: OfflineRegisrtaionRepoistory())
        super.viewDidLoad()
        errorMessageView.isHidden = true
        passwordTextField.autocorrectionType = .no
        confirmPasswordTextField.autocorrectionType = .no
    }
    
    // MARK: - Actions
    @IBAction func didPressNextStepButton(_ sender: UIButton) {
        registrationViewModel.signUp(email: usernameTextField.text ?? "", password: passwordTextField.text ?? "" , confirmPassword: confirmPasswordTextField.text ?? "")
    }
    
    override func observeBindables() {
        
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
        
        disposeBag.add(registrationViewModel.openNewsViewController.bind({ [weak self] navigateToHome in
            if navigateToHome {
                // todo navigate to home
                debugPrint("Navigate to Home")
            }
        }))
        
    }
}
