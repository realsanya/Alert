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
        showLightAlert()
    }
    
    @IBAction func darkAlertAction() {
        showDarkAlert()
    }
    
    @IBAction func alertWithThreeButtonsAction() {
        showAlertWithThreeButtons()
    }
    
    func showLightAlert() {
        let lightAlert = CustomAlertViewController.show("Hi! I'm Light Alert", msg: "Do you like how I look?", style: .light, buttons:[.yes, .no])
        present(lightAlert, animated: true, completion: nil)
    }
    
    func showDarkAlert() {
         let darkAlert = CustomAlertViewController.show("Hi! I'm Dark Alert", msg: "Do you like how I look?", style: .dark, buttons:[.yes, .no])
        present(darkAlert, animated: true, completion: nil)
    }

    
    func showAlertWithThreeButtons(){
        let alertWithThreeButtons = CustomAlertViewController.show("Hi! I'm Dark Alert", msg: "Do you like how I look?", buttons:[.yes, .no, .cancel])
        present(alertWithThreeButtons, animated: true, completion: nil)
    }
}

