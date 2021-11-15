//
//  String + Extensions.swift
//  SnapKitTest
//
//  Created by Сергей Лукичев on 15.11.2021.
//

import Foundation

extension String {
    var textFormatting: String {
        return self.removeLastZero.replacingADotWithAComma
    }
    
    private var removeLastZero: String {
        let splitValue = self.split(separator: ".")
        if splitValue.count > 1 && splitValue[1] == "0" {
            return String(splitValue[0])
        } else {
            return self
        }
    }
    
    private var replacingADotWithAComma: String {
        return self.replacingOccurrences(of: ".", with: ",")
    }
}
