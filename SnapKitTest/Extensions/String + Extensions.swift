//
//  String + Extensions.swift
//  SnapKitTest
//
//  Created by Сергей Лукичев on 15.11.2021.
//

import Foundation

private let formatter = NumberFormatter()

extension String {
    var textFormatting: String {
        formatter.groupingSize = 3
        formatter.groupingSeparator = " "
        formatter.usesGroupingSeparator = true
        if let number = Int(self.removeLastZero.replacingADotWithAComma) {
            let numberToFormat = NSNumber(value:number)
            return formatter.string(from: numberToFormat)!.removeLastZero.replacingADotWithAComma
        }
        return ""
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
