//
//  CalculatorProperties.swift
//  SnapKitTest
//
//  Created by Сергей Лукичев on 15.11.2021.
//

import Foundation

class CalculatorProperties {
    
    static let shared = CalculatorProperties()
    
    private var numberOne: Double = 0
    private var numberTwo: Double = 0
    private var sign: Sign        = .empty
    private var dotIsPlaced: Bool = false
    private var result            = Buttons.zero.rawValue
    private var resultOnDisplay   = ""
    var resultText: String {
        return result.textFormatting
    }
    
    private init() {}
    
    private func pressToNumber(number: String) {
        if self.result.count == 1 && self.result == Buttons.zero.rawValue {
            self.result = number
        } else {
            self.result += number
        }
    }
    
    private func pressToSign(tag: String) {
        switch tag {
            case Buttons.reset.rawValue:
                clearProperties()
            case Buttons.changeSign.rawValue:
                addMinus()
            case Buttons.percent.rawValue:
                addPersent()
            case Buttons.divide.rawValue:
                addSign(action: .divide)
            case Buttons.multiply.rawValue:
                addSign(action: .multiply)
            case Buttons.minus.rawValue:
                addSign(action: .minus)
            case Buttons.plus.rawValue:
                addSign(action: .plus)
            case Buttons.equals.rawValue:
                pressToResult()
            case Buttons.comma.rawValue:
                addDot()
            default:
                break
        }
    }
    
    private func addSign(action: Sign) {
        if self.numberOne != 0 && self.sign != .empty {
            guard let secondNumber = Double(self.result) else { return }
            self.numberTwo         = secondNumber
            calculateResult()
        }
        guard let firstNumber = Double(self.result) else { return }
        self.numberOne        = firstNumber
        self.sign             = action
        self.dotIsPlaced      = false
        self.result           = Buttons.zero.rawValue
        self.resultOnDisplay  = String(self.numberOne).textFormatting
    }
    
    private func addDot() {
        if !self.dotIsPlaced {
            self.result     += "."
            self.dotIsPlaced = true
        }
    }
    
    private func addMinus() {
        guard self.result != "" else { return }
        if Array(self.result)[0] == "-" {
            self.result = String(self.result.dropFirst(2))
        } else {
            self.result.insert("-", at: self.result.startIndex)
        }
    }
    
    private func addPersent() {
        if self.numberOne == 0 {
            self.result = String(Double(self.result)! / 100)
        } else {
            self.numberTwo = self.numberOne * Double(self.result)! / 100
        }
    }
    
    private func pressToResult() {
        guard let secondNumber = Double(self.result) else { return }
        self.numberTwo = secondNumber
        calculateResult()
        self.sign      = .empty
        self.numberOne = 0
    }
    
    private func calculateResult() {
        switch self.sign {
            case .plus:
                self.result = String(self.numberOne + self.numberTwo)
            case .minus:
                self.result = String(self.numberOne - self.numberTwo)
            case .multiply:
                self.result = String(self.numberOne * self.numberTwo)
            case .divide:
                self.result = String(self.numberOne / self.numberTwo)
            default:
                self.result = Buttons.zero.rawValue
        }
    }
    
    private func clearProperties() {
        self.numberOne   = 0
        self.numberTwo   = 0
        self.result      = Buttons.zero.rawValue
        self.sign        = .empty
        self.dotIsPlaced = false
    }
    
    func clickButtonHandler(withTag tag: String) {
        if tag == Buttons.reset.rawValue
            || tag == Buttons.equals.rawValue
            || tag == Buttons.plus.rawValue
            || tag == Buttons.minus.rawValue
            || tag == Buttons.multiply.rawValue
            || tag == Buttons.divide.rawValue
            || tag == Buttons.changeSign.rawValue
            || tag == Buttons.percent.rawValue
            || tag == Buttons.comma.rawValue{
            pressToSign(tag: tag)
        } else {
            if result.count < 10 {
                pressToNumber(number: String(tag))
            }
        }

    }
}
