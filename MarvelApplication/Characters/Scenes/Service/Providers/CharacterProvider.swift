//
//  CharacterProvider.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation
import Service

enum CharacterOrderBy {
    case nameIncrease
    case modifiedIncrease
    case nameDescrease
    case modifiedDecrease
    
    func get() -> String{
        switch self {
        
        case .nameIncrease:
            return "name"
        case .modifiedIncrease:
            return "modified"
        case .nameDescrease:
            return "-name"
        case .modifiedDecrease:
            return "-modified"
        }
    }
}

enum CharacterProvider {
    case characters(orderBy: CharacterOrderBy, limit: Int)
}


extension CharacterProvider: ServiceProtocol {
    
    var path: String {
        switch self {
        
        case .characters:
            return "\(CharacterBaseParameters.basePath)/v1/public/characters"
        }
    }
    
    var parameters: [String : Any]? {
        switch self {
        
        case .characters(orderBy: let orderBy, limit: let limit):
            return [
                "orderBy": orderBy.get(),
                "limit": limit,
                "apikey": CharacterBaseParameters.apiKey
            ]
        }
    }
    
    var headers: [String : String]? {
        return nil
    }
    
    
}
