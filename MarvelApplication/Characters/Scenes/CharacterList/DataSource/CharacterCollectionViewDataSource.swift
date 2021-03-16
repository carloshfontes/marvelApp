//
//  CharacterCollectionViewDataSource.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation


final class CharacterCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
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
        cell.configWith(name: character.name ?? "", andWithImage: nil)
        
        cell.backgroundColor = .red
        return cell
    }
    
    
}
