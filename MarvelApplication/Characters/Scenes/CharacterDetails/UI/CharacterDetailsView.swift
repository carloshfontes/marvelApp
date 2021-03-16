//
//  CharacterDetailsView.swift
//  Characters
//
//  Created by Carlos Fontes on 16/03/21.
//

import Foundation
import MarvelUI

final class CharacterDetailsView: UIView {
    
    private let backgroundImageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.contentMode = .scaleAspectFill
        view.backgroundColor = .green
        return view
    }()
    
    private let bottomDetailView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = UIColor(red: 0.15, green: 0.12, blue: 0.23, alpha: 1.00)
        return view
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = ""
        return label
    }()
    
    
    private let descriptionLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        label.text = ""
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.textAlignment = .justified
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    private func setupUI(){
        self.backgroundColor = .white
        setupViews()
    }
    
    func configViewWith(_ imagePath: String?, withDescription description: String?, andWithName name: String?){
        if let path = imagePath {
            self.backgroundImageView.setupWith(url: path)
            
        }
        
        if let description = description {
            self.descriptionLabel.text = description
        }
        
        if let name = name {
            self.nameLabel.text = name
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

// MARK: - View Codable

extension CharacterDetailsView: ViewCodable {
    
    
    func setupViewHierarchy() {
        addSubview(backgroundImageView)
        addSubview(bottomDetailView)
        bottomDetailView.addSubview(nameLabel)
        bottomDetailView.addSubview(descriptionLabel)
    }
    
    func setupConstraints() {
        setupBackgroundImageViewConstraints()
        setupBottomDetailViewConstraints()
        setupNameLabelConstraints()
        setupDescriptionLabelConstraints()
    }
    
    private func setupBackgroundImageViewConstraints(){
        backgroundImageView.setTopConstraintWith(topAnchor)
        backgroundImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        backgroundImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.0).isActive = true
        
    }
    
    private func setupBottomDetailViewConstraints(){
        bottomDetailView.setBottomConstraintWith(self.bottomAnchor)
        bottomDetailView.setLeftConstraintWith(self.leftAnchor)
        bottomDetailView.setRightConstraintWith(self.rightAnchor)
        bottomDetailView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.3).isActive = true
        
        bottomDetailView.layer.masksToBounds = true
        bottomDetailView.layer.cornerRadius = 25
    }
    
    private func setupNameLabelConstraints(){
        nameLabel.setTopConstraintWith(bottomDetailView.topAnchor, withConstantEqualTo: 20)
        nameLabel.setCenterXWith(bottomDetailView.centerXAnchor)
    }
    
    private func setupDescriptionLabelConstraints(){
        descriptionLabel.setLeftConstraintWith(bottomDetailView.leftAnchor, withConstantEqualTo: 20)
        descriptionLabel.setRightConstraintWith(bottomDetailView.rightAnchor, withConstantEqualTo: 20)
        descriptionLabel.setTopConstraintWith(nameLabel.bottomAnchor, withConstantEqualTo: 20)
        descriptionLabel.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.1).isActive = true
        descriptionLabel.setCenterXWith(self.centerXAnchor)
   
    }
    
    
    
}
