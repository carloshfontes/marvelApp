//
//  CharacterCD+CoreDataProperties.swift
//  Characters
//
//  Created by Carlos Fontes on 18/03/21.
//
//

import Foundation
import CoreData


extension CharacterCD {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CharacterCD> {
        return NSFetchRequest<CharacterCD>(entityName: "CharacterCD")
    }

    @NSManaged public var name: String
    @NSManaged public var thumbnail: Data?
    @NSManaged public var characterDescription: String?
    @NSManaged public var characterID: Int64
    @NSManaged public var id: UUID

}

extension CharacterCD : Identifiable {

}
