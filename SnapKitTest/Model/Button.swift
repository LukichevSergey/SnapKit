//
//  Button.swift
//  SnapKitTest
//
//  Created by Сергей Лукичев on 11.11.2021.
//

import Foundation
import UIKit

class Button: UIButton {
    
    var title: String?
    var color: UIColor? {
        if (title == Buttons.equals.rawValue
            || title == Buttons.divide.rawValue
            || title == Buttons.multiply.rawValue
            || title == Buttons.minus.rawValue
            || title == Buttons.plus.rawValue) {
            return .orange
        } else if (title == Buttons.reset.rawValue || title == Buttons.changeSign.rawValue || title == Buttons.percent.rawValue) {
            return .lightGray
        } else {
            return .darkGray
        }
    }
    var textAlignment: NSTextAlignment? {
        if title == "0" {
            return .left
        } else {
            return .center
        }
    }
    
    weak var delegate: ButtonDelegate?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    init(title: String, frame: CGRect) {
        self.title = title
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
//    override func layoutSubviews() {
//        self.layer.cornerRadius = self.frame.height / 2
//    }
    
    private func commonInit() {
        self.backgroundColor           = self.color
        self.titleLabel?.font          = .systemFont(ofSize: 35)
        self.titleLabel?.textAlignment = self.textAlignment!
        self.setTitle(self.title, for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.addTarget(self, action: #selector(pressToButton), for: .touchUpInside)
    }

    @objc func pressToButton() {
        delegate?.returnedValue(value: self.title!)
    }
    
}
