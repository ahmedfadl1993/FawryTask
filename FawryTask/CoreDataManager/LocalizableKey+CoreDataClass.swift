//
//  LocalizableKey+CoreDataClass.swift
//  Localization
//
//  Created by Sameh Salama on 13/02/2021.
//
//

import Foundation
import CoreData

@objc(LocalizableKey)
public class LocalizableKey: NSManagedObject,Codable {
    
    private enum CodingKeys: String, CodingKey {
        case id = "keyId"
        case key, type, version, translations
    }
    
    required convenience public init(from decoder: Decoder) throws {
        guard let context = decoder.userInfo[.context] as? NSManagedObjectContext else { fatalError("NSManagedObjectContext is missing") }
        let entity = NSEntityDescription.entity(forEntityName: "LocalizableKey", in: context)!
        self.init(entity: entity, insertInto: context)
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decode(Int64.self, forKey: .id)
        key = try values.decode(String.self, forKey: .key)
        type = try values.decode(String.self, forKey: .type)
        version = try values.decode(Int64.self, forKey: .version)
        translations = try? values.decode(Set<Translation>.self, forKey: .translations) as NSSet
    }
    
    public func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(key, forKey: .key)
        try container.encode(type, forKey: .type)
        try container.encode(version, forKey: .version)
        try container.encode(translations as! Set<Translation>, forKey: .translations)
    }
}
