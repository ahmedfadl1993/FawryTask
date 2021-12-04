//
//  LoginRepositoryProtocol.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

protocol LoginRepositoryProtocol {
    func login(email: String, password: String,
                success: @escaping Success,
                failure: @escaping Failure)
}
