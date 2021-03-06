//
//  ViewController.swift
//  SnapKitTest
//
//  Created by Сергей Лукичев on 11.11.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    private var buttons: [[Button]] = [[], [], [], [], [], []]
    
    private var stacks: [UIStackView] = []

    private lazy var label: UILabel = {
        let label                       = UILabel()
        label.text                      = "0"
        label.textAlignment             = .right
        label.textColor                 = .white
        label.minimumScaleFactor        = 0.5
        label.adjustsFontSizeToFitWidth = true
        label.font                      = .systemFont(ofSize: 65)
        return label
    }()
    
    private lazy var mainStack:   UIStackView = self.createStackView(axis: .vertical,   distribution: .fillProportionally)
    private lazy var bottomStack: UIStackView = self.createStackView(axis: .horizontal, distribution: .fillEqually)

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        //Создание кнопок
        Buttons.allCases.forEach { item in
            if item.rawValue == "0" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[4].append(button)
            } else if item.rawValue == "," || item.rawValue == "=" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[5].append(button)
            } else if item.rawValue == "1" || item.rawValue == "2" || item.rawValue == "3" || item.rawValue == "+" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[3].append(button)
            } else if item.rawValue == "4" || item.rawValue == "5" || item.rawValue == "6" || item.rawValue == "-" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[2].append(button)
            } else if item.rawValue == "7" || item.rawValue == "8" || item.rawValue == "9" || item.rawValue == "*" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[1].append(button)
            } else if item.rawValue == "AC" || item.rawValue == "+/-" || item.rawValue == "%" || item.rawValue == "/" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[0].append(button)
            }
        }

        // Перебор всех кнопок
        for (index, item) in buttons.enumerated() {
            
            //Создание горизонтального UIStackView
            lazy var stack: UIStackView = self.createStackView(axis: .horizontal, distribution: .fillProportionally)
            
            //Добавление UIStackView в массив
            stacks.append(stack)

            //Добавление констрейнтов для кнопок
            for button in item {
                stack.addArrangedSubview(button)
                button.snp.makeConstraints { make in
                    make.height.equalTo(button.snp.width).priority(999)
                }
            }
            
            if index == 4 || index == 5 {
                bottomStack.addArrangedSubview(stack)
                stack.distribution = .fillEqually
            } else {
                mainStack.addArrangedSubview(stack)
                stack.snp.makeConstraints { make in
                    make.right.left.equalTo(mainStack)
                }
            }
        }
        
        mainStack.addArrangedSubview(bottomStack)
        
        self.view.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.right.left.equalTo(self.view).inset(10)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }

        self.view.addSubview(label)
        label.snp.makeConstraints { make in
            make.height.equalTo(130)
            make.right.left.equalTo(self.view).inset(10)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(mainStack.snp.top)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        for buttonsBlock in buttons {
            for button in buttonsBlock {
                button.roundingButtons()
            }
        }
    }
    
    private func createStackView(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution) -> UIStackView {
        let stack          = UIStackView()
        stack.distribution = distribution
        stack.spacing      = 10
        stack.axis         = axis
        return stack
    }
}

extension ViewController: ButtonDelegate {
    func returnedValue(value: String) {
        CalculatorProperties.shared.clickButtonHandler(withTag: value)
        self.label.text = CalculatorProperties.shared.resultText
    }
}
