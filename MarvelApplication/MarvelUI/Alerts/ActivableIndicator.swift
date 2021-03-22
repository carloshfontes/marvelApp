//
//  ActivableIndicator.swift
//  MarvelUI
//
//  Created by Carlos Fontes on 21/03/21.
//

import UIKit

public protocol ActivableIndicator {
    var loadingIndicatorView: UIView? { get set }
    var activityIndicator: UIActivityIndicatorView? { get set }
    
    mutating func showLoadingIndicator(view: UIView)
    mutating func dismissLoadingIndicator()
    
}

public extension ActivableIndicator {
    
    mutating func showLoadingIndicator(view: UIView){
        loadingIndicatorView = UIView(frame: .zero)
        activityIndicator = UIActivityIndicatorView(style: .large)
        
        guard let loadingView = loadingIndicatorView, let activityIndicator = activityIndicator else {
            return
        }
        
        activityIndicator.startAnimating()
        view.addSubview(loadingView)
        loadingView.addSubview(activityIndicator)
        
        loadingView.setTopConstraintWith(view.topAnchor)
        loadingView.setLeftConstraintWith(view.leftAnchor)
        loadingView.setRightConstraintWith(view.rightAnchor)
        loadingView.setBottomConstraintWith(view.bottomAnchor)
        
        activityIndicator.setCenterXWith(loadingView.centerXAnchor)
        activityIndicator.setCenterYWith(loadingView.centerYAnchor)
    }
    
    mutating func dismissLoadingIndicator(){
        guard let loadingView = loadingIndicatorView, let activityIndicator = activityIndicator else {
            return
        }
        activityIndicator.stopAnimating()
        loadingView.removeFromSuperview()
        loadingIndicatorView = nil
    }
}
