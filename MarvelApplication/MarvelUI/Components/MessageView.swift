//
//  MessageView.swift
//  MarvelUI
//
//  Created by Carlos Fontes on 20/03/21.
//

import Foundation


public final class MessageView: UIView {
    
    private let messageLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.numberOfLines = 0
        label.lineBreakMode = .byCharWrapping
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupUI()
    }
    
    private func setupUI(){
        setupViews()
    }
    
    public func configMessageViewWithColor(_ color: UIColor = .white, withSize size: UIFont ,withMessage message: String, andWithMessageColor messageColor: UIColor = .black) {
        
        self.messageLabel.text = message
        self.messageLabel.font = size
        self.messageLabel.tintColor = messageColor
        
        self.backgroundColor = color
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MessageView: ViewCodable {
    
    public func setupViewHierarchy() {
        addSubview(messageLabel)
    }
    
    public func setupConstraints() {
        setupMessageLabelConstraints()
    }
    
    private func setupMessageLabelConstraints(){
        
        self.messageLabel.setLeftConstraintWith(leftAnchor, withConstantEqualTo: 20)
        self.messageLabel.setRightConstraintWith(rightAnchor, withConstantEqualTo: 20)

        self.messageLabel.setCenterXWith(self.centerXAnchor)
        self.messageLabel.setCenterYWith(self.centerYAnchor)

    }
    
}
