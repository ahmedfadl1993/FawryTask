//
//  LoginViewModel.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

class LoginViewModel: Validatable {
    
    private(set) var validationError = Bindable<String?>(nil)
    private(set) var loginSuccessfully = Bindable<Bool>(false)

    private var loginRepository: LoginRepositoryProtocol!

    init(loginRepository: LoginRepositoryProtocol) {
        self.loginRepository = loginRepository
    }
    
    func login(email: String, password: String) {
        // todo call service
        loginRepository.login(email: email, password: password) {
            [weak self] in
            guard let self = self else {
                return
            }
            self.loginSuccessfully.value = true
            // Todo save to userdefaults
            // redirect to homeview controller
            
        } failure: { [weak self] errorMessage in
            guard let self = self else {
                return
            }
            self.validationError.value = errorMessage
        }

    }
}
