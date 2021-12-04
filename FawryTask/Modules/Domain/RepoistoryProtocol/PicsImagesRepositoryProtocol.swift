//
//  PicsImagesRepositoryProtocol.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

protocol PicsImagesRepositoryProtocol {
    func signUp(page: Int, size: Int,
                success: @escaping Success,
                failure: @escaping Failure)
}


