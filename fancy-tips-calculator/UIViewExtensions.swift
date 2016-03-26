//
//  UIViewExtensions.swift
//  fancy-tips-calculator
//
//  Created by Kyler Blue on 3/23/16.
//  Copyright © 2016 Kyler Blue. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fadeIn() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.alpha = 1.0
            }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animateWithDuration(1.0, delay: 0.0, options: UIViewAnimationOptions.CurveEaseOut, animations: {
            self.alpha = 0.0
            }, completion: nil)
    }
    

}