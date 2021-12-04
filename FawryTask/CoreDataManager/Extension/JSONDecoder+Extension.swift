//
//  JSONDecoder+Extension.swift
//  Localization
//
//  Created by Ahmed Fadl on 14/02/2021.
//

import CoreData

extension JSONDecoder {
    convenience init(context: NSManagedObjectContext) {
        self.init()
        self.userInfo[.context] = context
    }
}
