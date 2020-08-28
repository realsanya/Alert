//
//  ActionButton.swift
//  CustomAlert
//
//  Created by Student 6 on 24/08/2020.
//  Copyright © 2020 Student 6. All rights reserved.
//

import Foundation
import UIKit

class ActionButton: UIButton {
    private var actionHandler: (()->Void)!
    
    init (withAction action: Action) {
        super.init(frame: .zero)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.actionHandler = action.actionHandler
        self.setUpButton(action: action)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUpButton(action: Action){
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        self.setTitle(action.title, for: .normal)
        self.layoutIfNeeded()
        self.layer.cornerRadius = 12
        self.addTarget(self, action: #selector(self.didTapButton), for: .touchUpInside)
        self.setUpForStyle(style: action.style)
    }
    
    private func setUpForStyle(style: ActionStyle){
        self.backgroundColor = style.backgroundColor
        self.setTitleColor(style.titleColor, for: .normal)
        self.setTitleColor(style.highlightedTitleColor, for: .highlighted)
    }
    
    @objc private func didTapButton(){
        self.actionHandler?()
    }
    
}
