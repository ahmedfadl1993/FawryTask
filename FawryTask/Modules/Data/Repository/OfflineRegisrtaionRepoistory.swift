//
//  OfflineRegisrtaionRepoistory.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation
class OfflineRegisrtaionRepoistory: RegisrtaionProtocol {
    
    func signUp(email: String, password: String,
                success: @escaping Success,
                failure: @escaping Failure) {

        CoreDataManager.insertUser(email: email, password: password) {
            success()
        } failure: { errorMessage in
            failure(errorMessage)
        }

        
    }
}
