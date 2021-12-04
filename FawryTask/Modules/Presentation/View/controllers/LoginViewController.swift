//
//  LoginViewController.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 03/12/2021.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorMessageLabel: UILabel!
    @IBOutlet weak var errorMessageView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // MARK: - Actions
    @IBAction func didPressLoginButton(_ sender: UIButton) {

    }

//    @IBAction func emailTextFieldDidChange(_ sender: UITextField) {
//
//    }

    @IBAction func didPressSignupButton(_ sender: UIButton) {
        let regViewController = RegistrationViewController()
        self.navigationController?.pushViewController(regViewController, animated: true)
    }
    
    @IBAction func showHidePasswordButtonAction(sender: UIButton) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
        sender.isSelected = !passwordTextField.isSecureTextEntry
    }
}


class SigninModel {
    var email: String = ""
    var password: String = ""
    convenience init(email: String, password: String) {
        self.init()
        self.email = email
        self.password = password
    }
}
