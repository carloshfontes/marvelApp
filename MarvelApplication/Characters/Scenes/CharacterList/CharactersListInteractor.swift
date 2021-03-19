//
//  CharactersListInteractor.swift
//  Characters
//
//  Created by Carlos Fontes on 13/03/21.
//

import Foundation
import Kingfisher

protocol CharactersListInteractorInput: class {
    var presenter: CharactersListPresenterInput? { get set }
    var characterServiceWorker: CharacterServiceWorkerProtocol { get set }
    
    func fetchListOfCharacterOrder(by: CharacterOrderBy, andWithLimit limit: Int)
    func addCharacterWith(request: CharactersListModels.Request.CharacterVO)
    func downloadImageWith(request: CharactersListModels.Request.Image, of character: CharactersListModels.Request.CharacterVO)
}

final class CharactersListInteractor: CharactersListInteractorInput {
    
    var characterServiceWorker: CharacterServiceWorkerProtocol
    var characterStorageWorker: CharacterStorageWorkerProtocol
    var presenter: CharactersListPresenterInput?
    
    init(serviceWorker: CharacterServiceWorkerProtocol = CharacterServiceWorker(), characterStorageWorker: CharacterStorageWorkerProtocol){
        self.characterServiceWorker = serviceWorker
        self.characterStorageWorker = characterStorageWorker
    }

    func fetchListOfCharacterOrder(by order: CharacterOrderBy, andWithLimit limit: Int) {
        self.characterServiceWorker.getListOfCharactersOrder(by: order, andWithLimit: limit) { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
            
            case .success(let characters):
                self.presenter?.presetListOfCharacter(response: CharactersListModels.Fetch.Response(characters: characters, errorMessage: nil))
            case .failure:
                self.presenter?.presetListOfCharacter(response: CharactersListModels.Fetch.Response(characters: nil, errorMessage: ""))
            }
        }
    }
    
    func addCharacterWith(request: CharactersListModels.Request.CharacterVO) {
        self.characterStorageWorker.addCharacterWith(character: request) { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success:
                self.presenter?.presentSucessToFavorite()
            case .failure(let error):
                self.presenter?.presentErrorWith(CharactersListModels.Response.Error(message: error.localizedDescription))
            }
        }
    }
    
    func downloadImageWith(request: CharactersListModels.Request.Image, of character: CharactersListModels.Request.CharacterVO) {
        
        guard let path = request.path else {
            return
        }
        
        guard let url = URL(string: path) else {
            return
        }
        
        let downloader = ImageDownloader.default
        
        downloader.downloadImage(with: url, completionHandler: { [weak self] result in
            guard let self = self else { return }

            switch result {

            case .success(let downloadedImage):
                self.presenter?.presentCharacterWithDownloadedImage(response: CharactersListModels.Response.CharacterVO(name: character.name, description: character.description, id: character.id, characterID: character.characterID, thumbnail: downloadedImage.originalData))

            case .failure(let error):
                self.presenter?.presentErrorWith(CharactersListModels.Response.Error(message: error.localizedDescription))
            }
        })
    }

}
