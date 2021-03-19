//
//  CharacterTableViewDataSource.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

final class CharacterTableViewDataSource: NSObject, UITableViewDataSource {
    
    var characterList: [FavoritesModels.ViewObject.CharacterVO]
    
    init(characterList: [FavoritesModels.ViewObject.CharacterVO]){
        self.characterList = characterList
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.uniqueIdentifier, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        
        let character: FavoritesModels.ViewObject.CharacterVO = characterList[indexPath.row]
        

        if let imageData = character.thumbnail {
            cell.configCellWith(name: character.name, andWithImage: UIImage(data: imageData))
        }else {
            cell.configCellWith(name: character.name)
        }
        return cell
    }
    
    
}
