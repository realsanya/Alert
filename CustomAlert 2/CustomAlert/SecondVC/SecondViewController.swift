//
//  SecondViewController.swift
//  CustomAlert
//
//  Created by Student 6 on 14/09/2020.
//  Copyright © 2020 Student 6. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet var alert: UIButton!
    
    @IBAction func alertAction() {
        self.showAlert()
    }
    
    func showAlert() {
        CustomAlertViewController.show("Hi! I'm Light Alert", msg: "Do you like how I look?", style: .light, buttons:[.yes, .no])
    }

}
