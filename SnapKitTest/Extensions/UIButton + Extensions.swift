//
//  UIButton + Extensions.swift
//  SnapKitTest
//
//  Created by Сергей Лукичев on 15.11.2021.
//

import Foundation
import UIKit

extension UIButton {
    func roundingButtons() {
        self.clipsToBounds                  = true
        self.layer.cornerRadius             = self.frame.size.height / 2
        self.titleLabel?.minimumScaleFactor = 0.3
    }
}

extension UIButton {
    func setBackgroundColor(color: UIColor, forState: UIControl.State) {
        self.clipsToBounds = true
        UIGraphicsBeginImageContext(CGSize(width: 1, height: 1))
        if let context = UIGraphicsGetCurrentContext() {
            context.setFillColor(color.cgColor)
            context.fill(CGRect(x: 0, y: 0, width: 1, height: 1))
            let colorImage = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            self.setBackgroundImage(colorImage, for: forState)
        }
    }
}
