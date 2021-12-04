//
//  UserDefaults+Extensions.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation

enum UserDefualtsKey: String {
    case loggedUser
}

extension UserDefaults {
 
    func save(isLoggedIn: Bool) {
        let key = UserDefualtsKey.loggedUser.rawValue
        UserDefaults.standard.set(isLoggedIn, forKey: key)
    }
    
    func isUserloggedIn() -> Bool {
        let key = UserDefualtsKey.loggedUser.rawValue
        return UserDefaults.standard.bool(forKey: key)
    }
    
    func deleteUserData() {
        let key = UserDefualtsKey.loggedUser.rawValue
        UserDefaults.standard.removeObject(forKey: key)
    }
    
}
