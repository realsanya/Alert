//
//  AlertStyle.swift
//  CustomAlert
//
//  Created by Student 6 on 11/09/2020.
//  Copyright © 2020 Student 6. All rights reserved.
//

import Foundation
import UIKit

enum AlertStyle: Int{
    case light
    case dark

    var backgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor.white
        case .dark:
            return UIColor.black.withAlphaComponent(0.8)
        }
    }

    var textColor: UIColor {
        switch self {
        case .light:
            return UIColor.black
        case.dark:
            return UIColor.white
        }
    }
}
