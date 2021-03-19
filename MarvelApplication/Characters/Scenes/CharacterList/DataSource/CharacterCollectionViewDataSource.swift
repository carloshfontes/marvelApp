//
//  CharacterCollectionViewDataSource.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation

protocol CharacterCollectionDelegate: class {
    
    func didTappedInFavoriteButtonAndSave(_ character: CharactersListModels.ViewObject.CharacterVO)
}

final class CharacterCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    weak var cellDelegate: CharacterCollectionDelegate?
    var characters: [CharactersListModels.ViewObject.CharacterVO]
    
    init(characters: [CharactersListModels.ViewObject.CharacterVO]){
        self.characters = characters
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.uniqueIdentifier, for: indexPath) as? CharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let character = self.characters[indexPath.row]
        cell.configWith(name: character.name ?? "", andWithImagePath: character.thumbnail)
        
        
        cell.favoriteButton.tintColor = .gray
        
        cell.didTappedOnFavoriteButton = { [weak self] in
            guard let self = self else { return }
            cell.favoriteButton.tintColor = .yellow
            self.cellDelegate?.didTappedInFavoriteButtonAndSave(character)
        }
        
        return cell
    }
    
    
    
}
