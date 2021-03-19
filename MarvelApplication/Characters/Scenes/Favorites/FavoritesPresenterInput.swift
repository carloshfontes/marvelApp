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
    func displayListOfCharacterWith(viewObject: [FavoritesModels.ViewObject.CharacterVO])
    func displayErrorWith(response: FavoritesModels.Response.Error)
}

final class FavoritesPresenter: FavoritesPresenterInput {
    
    weak var viewController: FavoritesPresenterOutput?
    
    func presentListOfCharacterWith(request: FavoritesModels.Request) {
        
        let charactersViewObject: [FavoritesModels.ViewObject.CharacterVO] = request.characterList.map { (character) -> FavoritesModels.ViewObject.CharacterVO in
            return FavoritesModels.ViewObject.CharacterVO(name: character.name, description: character.description, id: character.id, characterID: character.characterID, thumbnail: character.thumbnail)
            
        }
        
        viewController?.displayListOfCharacterWith(viewObject: charactersViewObject)
    }
    
    func presentErrorWith(request: FavoritesModels.Request.Error) {
        viewController?.displayErrorWith(response: FavoritesModels.Response.Error(message: request.message))
    }
}
