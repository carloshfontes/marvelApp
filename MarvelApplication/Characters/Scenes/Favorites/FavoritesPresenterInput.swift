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
    func presentSucessMessageWith(request: FavoritesModels.Request.Message)
}

protocol FavoritesPresenterOutput: class {
    func displayListOfCharacterWith(viewObject: [FavoritesModels.ViewObject.CharacterVO])
    func displayErrorWith(response: FavoritesModels.Response.Error)
    func displaySucessMessageWith(response: FavoritesModels.Response.Message)
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
    
    func presentSucessMessageWith(request: FavoritesModels.Request.Message) {
        viewController?.displaySucessMessageWith(response: FavoritesModels.Response.Message(text: request.text))
    }
}
