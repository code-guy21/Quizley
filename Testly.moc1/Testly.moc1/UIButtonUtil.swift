//
//  UIButtonUtil.swift
//  Testly.moc1
//
//  Created by Miguel Chavez on 4/19/17.
//  Copyright © 2017 Miguel Chavez. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}
//extension UIButton {
//     public func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
//        //super.didUpdateFocusInContext(context, withAnimationCoordinator: coordinator)
//        
//        if self.superview is AddCell {   // This ensures that all UIButtons aren't affected
//            if context.nextFocusedView == self {
//                // Perform actions for when UIButton is focused
//                print("123")
//            }else {
//                // Perform actions for when UIButton loses focus
//            }
//        }
//    }
//}
