//
//  ViewController.swift
//  CustomAlert
//
//  Created by Student 6 on 24/08/2020.
//  Copyright © 2020 Student 6. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var lightAlertButton: UIButton!
    @IBOutlet var darkAlertButton: UIButton!
    @IBOutlet var alertWithThreeButtons: UIButton!

    @IBAction func lightAlertAction() {
        CustomAlertViewController.show("Hi! I'm Light Alert", msg: "Do you like how I look?", style: .light, buttons:[.yes, .no])
    }
    
    @IBAction func darkAlertAction() {
        CustomAlertViewController.show("Hi! I'm Dark Alert", msg: "Do you like how I look?", style: .dark, buttons:[.yes, .no])
    }
    
    @IBAction func alertWithThreeButtonsAction() {
       CustomAlertViewController.show("Hi! I'm Dark Alert", msg: "Do you like how I look?", buttons:[.yes, .no, .cancel])
    }
}

