//
//  CharacterProtocol.swift
//  Characters
//
//  Created by Carlos Fontes on 18/03/21.
//

import Foundation

protocol CharacterProtocol {
    var name: String { get set }
    var description: String? { get set }
    var id: UUID { get set }
    var characterID: Int { get set }
    var thumbnail: Data? { get set }
}


struct CharacterObject: CharacterProtocol {
    
    var name: String
    var description: String?
    var id: UUID
    var characterID: Int
    var thumbnail: Data?
    
}
