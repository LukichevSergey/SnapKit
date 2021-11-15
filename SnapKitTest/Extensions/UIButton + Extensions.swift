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
