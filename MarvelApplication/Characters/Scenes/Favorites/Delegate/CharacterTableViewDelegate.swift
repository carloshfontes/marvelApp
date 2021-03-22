//
//  CharacterTableViewDelegate.swift
//  Characters
//
//  Created by Carlos Fontes on 20/03/21.
//

import UIKit

final class CharacterTableViewDelegate: NSObject, UITableViewDelegate {
    
    var didSelectCharacter: ((CharacterProtocol) -> Void)?
    var characterList: [FavoritesModels.ViewObject.CharacterVO]

    init(characterList: [FavoritesModels.ViewObject.CharacterVO]){
        self.characterList = characterList
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let character: FavoritesModels.ViewObject.CharacterVO = characterList[indexPath.row]
        
        didSelectCharacter?(character)
    }
}
