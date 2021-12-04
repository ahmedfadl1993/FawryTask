//
//  RegistrationViewModel.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

class RegistrationViewModel: Validatable {
    
    private(set) var validationError = Bindable<String?>(nil)
    private var repoistory: RegisrtaionProtocol!
    
    init (repoistory: RegisrtaionProtocol) {
        self.repoistory = repoistory
    }
    
    func signUp(email: String, password: String, confirmPassword: String) {
        
        if !isValidEmail(email: email){
            validationError.value = "Please Enter Valid Email"
            return
        }else if !isValidPassword(password: password) {
            validationError.value = "Please Enter Valid Password"
            return
        }else if password != confirmPassword {
            validationError.value = "The passwords you have entered don't match."
            return
        }else {
            repoistory.signUp(email: email, password: password) {
                print("Success")
            } failure: { errorMessage in
                print("errorrrrr : \(errorMessage)")
            }
        }

    }
}
