//
//  FavoritesPresenterInput.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation


protocol FavoritesPresenterInput: class {
    var viewController: FavoritesPresenterOutput? { get set }

    func presentListOfCharacterWith(request: FavoritesModels.Request)
    func presentErrorWith(request: FavoritesModels.Request.Error)
}

protocol FavoritesPresenterOutput: class {
    func displayListOfCharacterWith(response: FavoritesModels.Response)
    func displayErrorWith(response: FavoritesModels.Response.Error)
}

final class FavoritesPresenter: FavoritesPresenterInput {
    
    weak var viewController: FavoritesPresenterOutput?
    
    func presentListOfCharacterWith(request: FavoritesModels.Request) {
        
        let charactersViewObject: [FavoritesModels.Response.CharacterVO] = request.characterList.map { (character) -> FavoritesModels.Response.CharacterVO in
            return FavoritesModels.Response.CharacterVO(name: character.name, description: character.description, id: character.id, characterID: character.characterID, thumbnail: character.thumbnail)
            
        }
        
        viewController?.displayListOfCharacterWith(response: FavoritesModels.Response(characterList: charactersViewObject))
    }
    
    func presentErrorWith(request: FavoritesModels.Request.Error) {
        viewController?.displayErrorWith(response: FavoritesModels.Response.Error(message: request.message))
    }
}
