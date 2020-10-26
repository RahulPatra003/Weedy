//
//  SignupViewController.swift
//  Weedy
//
//  Created by MAC on 15/08/20.
//  Copyright © 2020 Salace. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {
    
    var circleAnimator: CircleAnimator?
    var selectedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //MARK:- Action
    @IBAction func tapSignUpBtn(_ sender: UIButton) {
        selectedButton = sender
        let vc = storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @IBAction func tapLoginBtn(_ sender: UIButton) {
        selectedButton = sender
       // self.dismiss(animated: true, completion: nil)
        self.navigationController?.popViewController(animated: true)
    }
}

//// MARK:- UIViewControllerTrasitioningDelegates method
//extension SignupViewController: UIViewControllerTransitioningDelegate {
//    
//    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        guard let backgroundColor = selectedButton.backgroundColor else { return circleAnimator }
//        circleAnimator = CircleAnimator(view: selectedButton, color: backgroundColor, duration: 0.4)
//        circleAnimator?.mode = .dismiss
//        return circleAnimator
//    }
//    
//    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
//        guard let backgroundColor = selectedButton.backgroundColor else { return circleAnimator }
//        circleAnimator = CircleAnimator(view: selectedButton, color: backgroundColor, duration: 0.5)
//        circleAnimator?.mode = .present
//        
//        return circleAnimator
//    }
//}
