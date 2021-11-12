//
//  Button.swift
//  SnapKitTest
//
//  Created by Сергей Лукичев on 11.11.2021.
//

import Foundation
import UIKit

class Button {
    
    var title: String
    var color: UIColor
    var textAlignment: NSTextAlignment
    
    var buttonDelegate: ButtonDelegate?
    
    init(title: String, color: UIColor, textAlignment: NSTextAlignment) {
        self.title = title
        self.color = color
        self.textAlignment = textAlignment
    }
    
    func settingButton() -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle("\(self.title)", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor           = self.color
        button.layer.cornerRadius        = button.frame.height / 2
        button.titleLabel?.font          = .systemFont(ofSize: 35)
        button.titleLabel?.textAlignment = self.textAlignment
        button.addTarget(self, action: #selector(pressToButton), for: .touchUpInside)
        return button
    }
    
    @objc func pressToButton() {
        print("test")
    }
    
}
