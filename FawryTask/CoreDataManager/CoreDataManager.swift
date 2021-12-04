//
//  CoreDataManager.swift
//  FawryTask
//
//  Created by Ahmed Fadl on 04/12/2021.
//

import Foundation
import CoreData

class CoreDataManager {
    
    // MARK: - Core Data stack
    static let context = persistentContainer.viewContext
    private static var persistentContainer: NSPersistentContainer = {
        
        let container = NSPersistentContainer(name: "UserloginCoreData")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext (success: @escaping Success,
                             failure: @escaping Failure) {
        if context.hasChanges {
            do {
                try context.save()
                success()
            } catch {
                let nserror = error as NSError
                failure(nserror.localizedDescription)
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
    static func insertUser(email: String, password: String,
                           success: @escaping Success,
                           failure: @escaping Failure) {

        let person = NSEntityDescription.insertNewObject(forEntityName: "Person",
                                                         into: context) as! Person
        
        person.email = email
        person.email = password
        saveContext {
            success()
        } failure: { errorMessage in
            failure(errorMessage)
        }

    }
    
    
    static func fetchPersons() -> [Person] {
        do {
            return try context.fetch(Person.fetchRequest())
        }
        catch {
            print(error.localizedDescription)
            return []
        }
    }
    
}
