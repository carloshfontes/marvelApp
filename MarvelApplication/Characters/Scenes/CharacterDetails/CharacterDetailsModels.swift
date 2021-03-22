//
//  CharacterDetailsModels.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation


struct CharacterDetailsModels {
    struct ViewObject {
        struct CharacterVO: CharacterProtocol {
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
            var thumbnailPath: String?
        }
    }
    
    struct Request {
        
        let characterList: [CharacterProtocol]
        
        struct CharacterVO: CharacterProtocol {
            
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
            var thumbnailPath: String?

        }
        
        struct Error {
            let message: String
        }
    }
    
    struct Response {
        
        let characterList: [CharacterVO]
        
        struct CharacterVO: CharacterProtocol {
            
            var name: String
            var description: String?
            var id: UUID
            var characterID: Int
            var thumbnail: Data?
            var thumbnailPath: String?

        }
        
        struct Error {
            let message: String
        }
        
        struct Message {
            let text: String
        }
    }
}
