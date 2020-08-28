//
//  Action.swift
//  CustomAlert
//
//  Created by Student 6 on 24/08/2020.
//  Copyright © 2020 Student 6. All rights reserved.
//

import Foundation
import UIKit

enum ActionStyle {
    case normal
    case normalDark
    case destructive
    case destructiveDark
    case positive
    case positiveDark
    
    var titleColor: UIColor {
        switch self {
        case .destructive, .positive, .normal:
            return UIColor.white
        case .normalDark, .destructiveDark, .positiveDark:
            return UIColor.black
        }
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .normal:
            return UIColor.darkGray.withAlphaComponent(0.5)
        case .normalDark:
            return UIColor.lightGray
        case .destructive, .destructiveDark:
            return UIColor.red
        case .positive, .positiveDark:
            return UIColor.green
        }
    }
    
    var highlightedTitleColor: UIColor {
            return self.titleColor.withAlphaComponent(0.6)
    }
}

class Action {
    var title: String
    var style: ActionStyle
    var actionHandler: () -> Void
    
    init(with title: String, style: ActionStyle, actionHandler: @escaping () -> Void) {
        self.title = title
        self.style = style
        self.actionHandler = actionHandler
    }
}
