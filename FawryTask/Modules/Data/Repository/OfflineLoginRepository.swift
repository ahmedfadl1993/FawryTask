//
//  OfflineLoginRepository.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

class OfflineLoginRepository: LoginRepositoryProtocol {
    
    func login(email: String, password: String, success: @escaping Success, failure: @escaping Failure) {
        let users = CoreDataManager.fetchPersonBy(email: email, password: password)
        if users.isEmpty {
            failure("user not found try again later")
        }else {
            success()
        }
        
        CoreDataManager.fetchPersons()
    }
    
}
