//
//  ErrorResponse.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

struct ErrorResponse {
    
    var statusCode:Int
    var message:String
    
    init(statusCode:Int , message:String) {
        self.statusCode = statusCode
        self.message = message
    }
    
}
