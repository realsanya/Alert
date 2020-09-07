//
//  Action.swift
//  CustomAlert
//
//  Created by Student 6 on 24/08/2020.
//  Copyright © 2020 Student 6. All rights reserved.
//

import Foundation
import UIKit

enum Action {
    
    case normal (title: String)
    case yes
	case no
	case cancel

	var title: String {
		switch self {
        case .normal( let title ): return title
            case .yes: return "Yes"
            case .no: return "No"
            case .cancel: return "Cancel"
		}
	}

    var titleColor: UIColor {
            return UIColor.black
    }
    
    var backgroundColor: UIColor {
        switch self {
        case .normal:
            return UIColor.darkGray.withAlphaComponent(0.5)
        case .cancel:
            return UIColor.lightGray
        case .no:
            return UIColor.red
        case .yes:
            return UIColor.green
        }
    }
    
    var highlightedTitleColor: UIColor {
            return self.titleColor.withAlphaComponent(0.6)
    }
}

