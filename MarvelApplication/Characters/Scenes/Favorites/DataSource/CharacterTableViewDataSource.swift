//
//  CharacterTableViewDataSource.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation

final class CharacterTableViewDataSource: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CharacterTableViewCell.uniqueIdentifier, for: indexPath) as? CharacterTableViewCell else {
            return UITableViewCell()
        }
        
        return cell
    }
    
    
}
