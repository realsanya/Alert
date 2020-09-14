//
//  CustomAlertViewController.swift
//  CustomAlert
//
//  Created by Student 6 on 24/08/2020.
//  Copyright © 2020 Student 6. All rights reserved.
//

import UIKit

class CustomAlertViewController: UIViewController {
    
    public var alertTitle: String!
    public var alertMessage: String!
    private var actions = [Action]()
    public var axis: NSLayoutConstraint.Axis = .horizontal
    public var alertStyle = AlertStyle.light
    
    public var _modalPresentationStyle: UIModalPresentationStyle = .overCurrentContext
    public var _modalTransitionStyle: UIModalTransitionStyle = .crossDissolve
    
    private var backdropView = BackdropView(frame: .null, backgroundColor: UIColor.black.withAlphaComponent(0.0), cornerRadius: 0.0)
    private var containerView = UIView()
    
//    private lazy var backdropView: UIView = {
//        let view = BackdropView(frame: .null, backgroundColor: UIColor.black.withAlphaComponent(0.0), cornerRadius: 0.0)
//        return view
//    } ()
    
//    private lazy var containerView: UIView = {
//        let view = UIView()
//        view.translatesAutoresizingMaskIntoConstraints = false
//        view.backgroundColor = alertStyle.backgroundColor
//        view.layer.cornerRadius = 10.0
//        return view
//        }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.containerView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        perform(#selector(animateAlert), with: self, afterDelay: 0.2)
    }
    
      @objc private func animateAlert(){
             backdropView.alpha = 0.0
             UIView.animate(withDuration: 0.1, animations: {
                 self.backdropView.alpha = 0.1
                 self.backdropView.backgroundColor = UIColor.black.withAlphaComponent(0.6)
                 self.containerView.transform = .identity
             })
    }
    
    
    // MARK: -initialize the alert
    init(withTitle title: String?, message: String? = nil, buttons: [Action], axis: NSLayoutConstraint.Axis, style: AlertStyle = .light ){
        super.init(nibName: nil, bundle: nil)
        self.alertTitle = title
        self.alertMessage = message
        self.actions = buttons
        self.axis = axis
        self.alertStyle = style
        self.modalPresentationStyle = _modalPresentationStyle
        self.modalTransitionStyle = _modalTransitionStyle
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    static func show(_ title:String, msg:String, style: AlertStyle? = .dark, buttons: [Action] = [ .normal(title: "Ok") ], handle: (( Action )->Void)? = nil )  {
        let alertVС  = CustomAlertViewController(withTitle: title, message: msg, buttons: buttons, axis: .horizontal, style: style ?? .light);
        
        //?
        UIApplication.shared.keyWindow?.rootViewController?.present(alertVС, animated: true, completion: nil)
    }
    
    func didTapButton(){
        self.dismiss(animated: true, completion: nil)
    }
    
//MARK: -

    private func setUpUI(){
        
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.backgroundColor = alertStyle.backgroundColor
        containerView.layer.cornerRadius = 10.0
        
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.numberOfLines = 0
        titleLabel.textColor =  alertStyle.textColor
        titleLabel.textAlignment = .center
        titleLabel.font = UIFont.boldSystemFont(ofSize: 17.0)
        titleLabel.text = alertTitle
        titleLabel.isHighlighted = alertTitle != nil ? false : true
        
        let messageLabel = UILabel()
        messageLabel.translatesAutoresizingMaskIntoConstraints = false
        messageLabel.numberOfLines = 0
        messageLabel.textColor =  alertStyle.textColor
        messageLabel.textAlignment = .center
        messageLabel.font = UIFont.boldSystemFont(ofSize: 15.0)
        messageLabel.text = alertMessage
        messageLabel.isHighlighted = alertMessage != nil ? false : true
        
        let titleStackView = UIStackView()
        titleStackView.translatesAutoresizingMaskIntoConstraints = false
        titleStackView.axis = .vertical
        titleStackView.spacing = 5.0
        titleStackView.alignment = .fill
        titleStackView.distribution = .fillProportionally
        
        let actionsStackView = UIStackView()
        actionsStackView.translatesAutoresizingMaskIntoConstraints = false
        actionsStackView.axis = self.axis
        actionsStackView.spacing = 10.0
        actionsStackView.alignment = .fill
        actionsStackView.distribution = .fillEqually
        
        self.view.addSubview(backdropView)
        self.view.addSubview(containerView)
        self.containerView.addSubview(titleStackView)
        self.containerView.addSubview(actionsStackView)
        titleStackView.addArrangedSubview(titleLabel)
        titleStackView.addArrangedSubview(messageLabel)
        
        self.backdropView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        self.backdropView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        self.backdropView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        self.backdropView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        
        self.containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        self.containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        self.containerView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24).isActive = true
        self.containerView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24).isActive = true
        
        titleStackView.topAnchor.constraint(equalTo: containerView.topAnchor, constant: 24.0).isActive = true
        titleStackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 24.0).isActive = true
        titleStackView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -24.0).isActive = true
        
        actionsStackView.topAnchor.constraint(equalTo: titleStackView.bottomAnchor, constant: 8.0).isActive = true
        actionsStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -24.0).isActive = true
        actionsStackView.leftAnchor.constraint(equalTo: containerView.leftAnchor, constant: 24.0).isActive = true
        actionsStackView.rightAnchor.constraint(equalTo: containerView.rightAnchor, constant: -24.0).isActive = true
        
        for action in actions {
            let actionButt = ActionButton( action: action, actionHandler: {
                self.didTapButton()
            })
            actionsStackView.addArrangedSubview( actionButt )
        }
    }
}

