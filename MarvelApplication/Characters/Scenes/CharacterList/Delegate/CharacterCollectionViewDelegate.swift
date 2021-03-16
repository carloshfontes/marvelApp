//
//  CharacterCollectionViewDelegate.swift
//  Characters
//
//  Created by Carlos Fontes on 15/03/21.
//

import Foundation


final class CharacterCollectionViewDelegate: NSObject, UICollectionViewDelegateFlowLayout {
    
    var characterListVO: [CharactersListModels.ViewObject.CharacterVO]
    var didSelectCharacter: ((CharactersListModels.ViewObject.CharacterVO) -> Void)?
    
    init(characterListVO: [CharactersListModels.ViewObject.CharacterVO]){
        self.characterListVO = characterListVO
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: 380 , height: 480)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let characterVO: CharactersListModels.ViewObject.CharacterVO = characterListVO[indexPath.row]
        
        didSelectCharacter?(characterVO)
        
    }
}
