//
//  CharactersListPresenter.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation

protocol CharactersListPresenterInput: class{
    var viewController: CharactersListPresenterOutput? { get set }
    
    func presetListOfCharacter(response: CharactersListModels.Fetch.Response)
    func presentErrorWith(_ response: CharactersListModels.Response.Error)
    func presentSucessToFavorite()
}

protocol CharactersListPresenterOutput: class{
    func displayListOfCharactersWith(viewObject: CharactersListModels.ViewObject)
    func displayErrorWith(message: CharactersListModels.Error)
}

final class CharactersListPresenter: CharactersListPresenterInput {

    weak var viewController: CharactersListPresenterOutput?

    
    func presetListOfCharacter(response: CharactersListModels.Fetch.Response) {
        
        if let characters = response.characters {
            let characterListVO = characters.map { (character) -> CharactersListModels.ViewObject.CharacterVO in
                return CharactersListModels.ViewObject.CharacterVO(id: character.id, name: character.name, description: character.description, thumbnail: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")
            }
            
            viewController?.displayListOfCharactersWith(viewObject: CharactersListModels.ViewObject(characters: characterListVO))
        }else if let error = response.errorMessage {
            viewController?.displayErrorWith(message: CharactersListModels.Error(message: error))
        }

    }
    
    func presentErrorWith(_ response: CharactersListModels.Response.Error) {
        
    }
    
    func presentSucessToFavorite() {
    }
}
