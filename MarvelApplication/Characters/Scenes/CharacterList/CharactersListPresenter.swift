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
    func presentCharacterWithDownloadedImage(response: CharactersListModels.Response.CharacterVO)
    func presetnEmptyListOfCharacter(response: CharactersListModels.Response.Message)
    func presentMessageWith(reesponse: CharactersListModels.Response.Message)
    func presentLoadingIndicator()
    func presentStopLoadingIndicator()
}

protocol CharactersListPresenterOutput: class{
    func displayListOfCharactersWith(viewObject: CharactersListModels.ViewObject)
    func displayErrorWith(message: CharactersListModels.Error)
    func saveCharacterWith(viewObject: CharactersListModels.ViewObject.CharacterProtocolVO)
    func displayEmptyListOfCharacter(response: CharactersListModels.Response.Message)
    func displayMessageWith(response: CharactersListModels.Response.Message)
    func displayLoadingIndicator()
    func stopLoadingIndicator()
}

final class CharactersListPresenter: CharactersListPresenterInput {

    weak var viewController: CharactersListPresenterOutput?

    func presetListOfCharacter(response: CharactersListModels.Fetch.Response) {
        
        if let characters = response.characters {
            let characterListVO = characters.map { (character) -> CharactersListModels.ViewObject.CharacterVO in
                return CharactersListModels.ViewObject.CharacterVO(name: character.name, description: character.description, id: character.id, characterID: character.characterID,thumbnailPath: character.thumbnailPath)
            }
            
            viewController?.displayListOfCharactersWith(viewObject: CharactersListModels.ViewObject(characters: characterListVO))
        }else if let error = response.errorMessage {
            viewController?.displayErrorWith(message: CharactersListModels.Error(message: error))
        }

    }
    
    func presentErrorWith(_ response: CharactersListModels.Response.Error) {
        viewController?.displayErrorWith(message: CharactersListModels.Error(message: response.message))
    }
    
    func presentCharacterWithDownloadedImage(response: CharactersListModels.Response.CharacterVO) {
        viewController?.saveCharacterWith(viewObject: CharactersListModels.ViewObject.CharacterProtocolVO(name: response.name, description: response.description, id: response.id, characterID: response.characterID, thumbnail: response.thumbnail))
    }
    
    func presetnEmptyListOfCharacter(response: CharactersListModels.Response.Message) {
        viewController?.displayEmptyListOfCharacter(response: response)
    }
    
    func presentMessageWith(reesponse: CharactersListModels.Response.Message) {
        viewController?.displayMessageWith(response: reesponse)
    }
    
    func presentLoadingIndicator() {
        
    }
    
    func presentStopLoadingIndicator() {
        
    }
}
