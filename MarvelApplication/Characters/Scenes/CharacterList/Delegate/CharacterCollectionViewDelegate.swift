//
//  CharacterCollectionViewDelegate.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation


final class CharacterCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 340 , height: 480)
    }
}
