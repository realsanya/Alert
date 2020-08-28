//
//  BackdropView.swift
//  CustomAlert
//
//  Created by Student 6 on 26/08/2020.
//  Copyright © 2020 Student 6. All rights reserved.
//

import Foundation
import UIKit

class BackdropView: UIView {
    
    private var background: UIColor?
    private var cornerRadius: CGFloat?
    
    init(frame: CGRect, backgroundColor: UIColor = UIColor.white, cornerRadius: CGFloat = 0.0) {
        super.init(frame: frame)
        self.translatesAutoresizingMaskIntoConstraints = false
        self.background = backgroundColor
        self.layer.cornerRadius = cornerRadius
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
