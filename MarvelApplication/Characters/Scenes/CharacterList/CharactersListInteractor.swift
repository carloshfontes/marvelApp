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
    func fetchListOfCharacterWith(_ name: String, byOrder order: CharacterOrderBy, andWithLimit limit: Int)
    func addCharacterWith(request: CharactersListModels.Request.CharacterVO)
    func downloadImageWith(request: CharactersListModels.Request.Image, of character: CharactersListModels.Request.CharacterVO)
    
    func activeLoadingIndicator()
    func stopLoadingIndicator()
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
                
                if characters.count > 0 {
                    
                    let characterListVO: [CharacterDetailsModels.Response.CharacterVO] = characters.map { (character) -> CharacterDetailsModels.Response.CharacterVO in
                        return CharacterDetailsModels.Response.CharacterVO(name: character.name, description: character.description, id: UUID(), characterID: character.id, thumbnail: nil, thumbnailPath: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")
                    }
                    
                    self.presenter?.presetListOfCharacter(response: CharactersListModels.Fetch.Response(characters: characterListVO, errorMessage: nil))
                }else {
                    self.presenter?.presetnEmptyListOfCharacter(response: CharactersListModels.Response.Message(text: "Não possui personagens cadastrados. "))
                }
                
                
            case .failure(let error):
                self.presenter?.presetListOfCharacter(response: CharactersListModels.Fetch.Response(characters: nil, errorMessage: error.localizedDescription))
            }
        }
    }
    
    func fetchListOfCharacterWith(_ name: String, byOrder order: CharacterOrderBy, andWithLimit limit: Int) {
        
        self.characterServiceWorker.getListOfCharactersStartsWith(name, orderBy: order, andWithLimit: limit) { (result) in
            
            switch result {
            
            case .success(let characterList):
                
                if characterList.count > 0{
                    
                    let characterListVO: [CharacterDetailsModels.Response.CharacterVO] = characterList.map { (character) -> CharacterDetailsModels.Response.CharacterVO in
                        return CharacterDetailsModels.Response.CharacterVO(name: character.name, description: character.description, id: UUID(), characterID: character.id, thumbnail: nil, thumbnailPath: "\(character.thumbnail.path).\(character.thumbnail.thumbnailExtension)")
                    }
                    
                    self.presenter?.presetListOfCharacter(response: CharactersListModels.Fetch.Response(characters: characterListVO, errorMessage: nil))
                } else {
                    self.presenter?.presetnEmptyListOfCharacter(response: CharactersListModels.Response.Message(text: "Não possui personagens cadastrados. "))
                }
                
            case .failure(let error):
                self.presenter?.presetListOfCharacter(response: CharactersListModels.Fetch.Response(characters: nil, errorMessage: error.localizedDescription))
            }
        }
    }
    
    func addCharacterWith(request: CharactersListModels.Request.CharacterVO) {
        self.characterStorageWorker.addCharacterWith(character: request) { [weak self] (result) in
            
            guard let self = self else { return }
            
            switch result {
                
            case .success:
                self.presenter?.presentMessageWith(reesponse: CharactersListModels.Response.Message(text: "Personagem favoritado com suceesso."))
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

    
    func activeLoadingIndicator() {
        
    }
    
    func stopLoadingIndicator() {
        
    }
}
