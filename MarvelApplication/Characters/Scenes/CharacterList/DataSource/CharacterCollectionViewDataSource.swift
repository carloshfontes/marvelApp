//
//  CharacterCollectionViewDataSource.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation


final class CharacterCollectionViewDataSource: NSObject, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CharacterCollectionViewCell.uniqueIdentifier, for: indexPath) as? CharacterCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        cell.backgroundColor = .red
        return cell
    }
    
    
}
