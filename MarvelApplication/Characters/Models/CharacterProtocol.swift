//
//  CharacterProtocol.swift
//  Characters
//
//  Created by Carlos Fontes on 18/03/21.
//

import Foundation

public protocol CharacterProtocol {
    var name: String { get set }
    var description: String? { get set }
    var id: UUID { get set }
    var characterID: Int { get set }
    var thumbnail: Data? { get set }
}


public struct CharacterObject: CharacterProtocol {
    
    public var name: String
    public var description: String?
    public var id: UUID
    public var characterID: Int
    public var thumbnail: Data?
    
    public init(name: String, description: String?, id: UUID, characterID: Int, thumbnail: Data?){
        self.name = name
        self.description = description
        self.id = id
        self.characterID = characterID
        self.thumbnail = thumbnail
    }
    
}
