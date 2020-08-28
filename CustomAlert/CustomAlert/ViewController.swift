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
        let customLightAlert = CustomAlertViewController(withTitle: "Hi! I'm Light Alert", message:"Do you like how I look?", axis: .horizontal, style: .light)
        
        customLightAlert.addAction(with: "Yes", style: .positiveDark, actionHandler:{[weak self] in
            print("Button \"Yes\" pressed")
            self?.dismiss(animated: true, completion: nil)
        })
        customLightAlert.addAction(with: "No", style: .destructiveDark, actionHandler:{[weak self] in
            print("Button \"No\" pressed")
            self?.dismiss(animated: true, completion: nil)
        })
        
        present(customLightAlert, animated: true, completion: nil)
    }
    
    func showDarkAlert() {
        let customDarkAlert = CustomAlertViewController(withTitle: "Hi! I'm Dark Alert", message:"Do you like how I look?", axis: .horizontal, style: .dark)
        
        customDarkAlert.addAction(with: "Yes", style: .positive, actionHandler:{[weak self] in
            print("Button \"Yes\" pressed")
            self?.dismiss(animated: true, completion: nil)
        })
        customDarkAlert.addAction(with: "No", style: .destructive, actionHandler:{[weak self] in
            print("Button \"No\" pressed")
            self?.dismiss(animated: true, completion: nil)
        })
        
        present(customDarkAlert, animated: true, completion: nil)
    }
    
    func showAlertWithThreeButtons(){
        let customAlertWithThreeButtons = CustomAlertViewController(withTitle: "Hi! I'm Alert With Three Buttons", message:"Do you like how I look?", axis: .vertical, style: .light)
        
        customAlertWithThreeButtons.addAction(with: "Yes", style: .positiveDark, actionHandler:{[weak self] in
            print("Button \"Yes\" pressed")
            self?.dismiss(animated: true, completion: nil)
        })
        customAlertWithThreeButtons.addAction(with: "Maybe", style: .normalDark,  actionHandler:{[weak self] in
            print("Button \"Maybe\" pressed")
            self?.dismiss(animated: true, completion: nil)
        })
        
        customAlertWithThreeButtons.addAction(with: "No", style: .destructiveDark, actionHandler:{[weak self] in
            print("Button \"No\" pressed")
            self?.dismiss(animated: true, completion: nil)
        })
        
        present(customAlertWithThreeButtons, animated: true, completion: nil)
    }
}

