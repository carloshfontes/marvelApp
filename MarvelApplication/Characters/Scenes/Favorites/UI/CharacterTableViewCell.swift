//
//  CharacterTableViewCell.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation
import MarvelUI

final class CharacterTableViewCell: UITableViewCell, Identifiable {
    
    private let thumbnailUIImageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .black
        return view
    }()
    
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
    
    func configCellWith(name: String, andWithImage image: UIImage? = nil){
        self.characterNameLabel.text = name
        
        if let image = image {
            self.thumbnailUIImageView.image = image
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - View Codable

extension CharacterTableViewCell: ViewCodable {
    
    func setupViewHierarchy() {
        addSubview(thumbnailUIImageView)
        addSubview(characterNameLabel)
    }
    
    func setupConstraints() {
        setupThumbnailUIImageViewConstraints()
        setupCharacterNameLabelConstraints()
    }
    
    private func setupThumbnailUIImageViewConstraints(){
        thumbnailUIImageView.widthAnchor.constraint(equalToConstant: 60).isActive = true
        thumbnailUIImageView.heightAnchor.constraint(equalToConstant: 60).isActive = true
        thumbnailUIImageView.layer.cornerRadius = 5
        thumbnailUIImageView.setCenterYWith(self.centerYAnchor)
        thumbnailUIImageView.setLeftConstraintWith(self.leftAnchor, withConstantEqualTo: 20)
    }
    
    private func setupCharacterNameLabelConstraints(){
        characterNameLabel.setCenterXWith(self.centerXAnchor)
        characterNameLabel.setCenterYWith(self.centerYAnchor)
    }
    
    
}
