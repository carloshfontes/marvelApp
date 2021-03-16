//
//  CharactersListModels.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation


struct CharactersListModels {
    struct Fetch {
        struct Response {
            let characters: [Character]?
            let errorMessage: String?
        }
    }
    
    struct ViewObject {
        
        var characters: [CharacterVO]
        
        struct CharacterVO {
            let id: Int?
            let name: String?
            let description: String?
            let thumbnail: String?
        }
        
    }
    
    struct Request {
        struct CharacterVO {
            let id: Int?
            let name: String?
            let description: String?
            let thumbnail: String?
        }
    }
    
    struct Error {
        let message: String
    }
}
