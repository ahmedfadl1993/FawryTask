//
//  PasswordViewController.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 03/12/2021.
//

import UIKit

class PasswordViewController: UIViewController {
    
    @IBOutlet weak var usernameLabel: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var errorMessageView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - Actions
    @IBAction func didPressNextStepButton(_ sender: UIButton) {
        
    }
    
    @IBAction func passwordTextFieldDidChange(_ sender: UITextField) {
        
    }
    
    @IBAction func showHidePasswordButtonAction(sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        sender.isSelected = !passwordTextField.isSecureTextEntry
    }
}
