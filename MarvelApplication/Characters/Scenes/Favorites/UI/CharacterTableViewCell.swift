//
//  CharacterTableViewCell.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation
import MarvelUI

final class CharacterTableViewCell: UITableViewCell, Identifiable {
    
    private let characterNameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
    }
    
    private func setupUI(){
        setupViews()
    }
    
    func configCellWith(name: String, andWithImage image: UIImage){
        self.characterNameLabel.text = name
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable

extension CharacterTableViewCell: ViewCodable {
    
    func setupViewHierarchy() {
        addSubview(characterNameLabel)
    }
    
    func setupConstraints() {
        setupCharacterNameLabelConstraints()
    }
    
    private func setupCharacterNameLabelConstraints(){
        characterNameLabel.setCenterXWith(self.centerXAnchor)
        characterNameLabel.setCenterYWith(self.centerYAnchor)
    }
    
    
}
