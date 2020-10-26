//
//  LoginViewController.swift
//  Weedy
//
//  Created by MAC on 15/08/20.
//  Copyright © 2020 Salace. All rights reserved.
//

import UIKit
import IBAnimatable


class LoginViewController: UIViewController {
    
    @IBOutlet weak var titleView: AnimatableView!

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Action
    @IBAction func tapSignUpBtn(_ sender: UIButton) {
        let vc = storyboard?.instantiateViewController(withIdentifier: "SignupViewController") as! SignupViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapLoginBtn(_ sender: UIButton) {
        let tempButton = TransitionButton()
        tempButton.backgroundColor = sender.backgroundColor
        
        self.view.addSubview(tempButton)
        self.view.bringSubviewToFront(tempButton)
        
        tempButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            tempButton.centerYAnchor.constraint(equalTo: sender.centerYAnchor) ,
            tempButton.centerXAnchor.constraint(equalTo: sender.centerXAnchor) ,
            tempButton.heightAnchor.constraint(equalToConstant: sender.frame.height) ,
            tempButton.widthAnchor.constraint(equalToConstant: sender.frame.width)
            
        ])
        
        tempButton.layer.cornerRadius = (tempButton.frame.height / 2)
        tempButton.alpha = 0
        
        UIView.animate(withDuration: 0.3, animations: {
            sender.alpha = 0
            tempButton.alpha = 1
        }) { (isSuccess) in
            if isSuccess {
                if isSuccess {
                    tempButton.startAnimation()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        tempButton.stopAnimation(animationStyle: .expand, revertAfterDelay: 0.8) {
                            let vc = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
                            self.navigationController?.pushViewController(vc, animated: true)
                        }
                    }
                }
            }
        }
    }
}
