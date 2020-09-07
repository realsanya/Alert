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

	static let font = UIFont.boldSystemFont(ofSize: 15)
    
    private var actionHandler: (()->Void)?
    
    init( action: Action, actionHandler: (()->())?) {

        super.init(frame: .zero)

        self.translatesAutoresizingMaskIntoConstraints = false
        self.actionHandler = actionHandler

		self.titleLabel?.font = ActionButton.font
        self.layer.cornerRadius = 12

		self.heightAnchor.constraint(equalToConstant: 45).isActive = true

        self.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)

        self.setTitle(action.title, for: .normal)
        self.backgroundColor = action.backgroundColor
		self.setTitleColor(action.titleColor, for: .normal)
        self.setTitleColor(action.highlightedTitleColor, for: .highlighted)
    }

    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
    @objc private func didTapButton(){
        self.actionHandler?()
    }
    
}
