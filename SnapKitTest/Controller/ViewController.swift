//
//  ViewController.swift
//  SnapKitTest
//
//  Created by Сергей Лукичев on 11.11.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    var buttons: [[Button]] = [[], [], [], [], []]
    
    var stacks: [UIStackView] = []

    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "0"
        label.textAlignment = .right
        label.textColor = .white
        label.font = .systemFont(ofSize: 65)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        
        //Создание кнопок
        Buttons.allCases.forEach { item in
            if item.rawValue == "0" || item.rawValue == "," || item.rawValue == "=" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[0].append(button)
            } else if item.rawValue == "1" || item.rawValue == "2" || item.rawValue == "3" || item.rawValue == "+" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[1].append(button)
            } else if item.rawValue == "4" || item.rawValue == "5" || item.rawValue == "6" || item.rawValue == "-" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[2].append(button)
            } else if item.rawValue == "7" || item.rawValue == "8" || item.rawValue == "9" || item.rawValue == "*" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[3].append(button)
            } else if item.rawValue == "AC" || item.rawValue == "+/-" || item.rawValue == "%" || item.rawValue == "/" {
                let button = Button(title: item.rawValue, frame: .zero)
                button.delegate = self
                self.buttons[4].append(button)
            }
        }

        //Создание вертикального UIStackView
        lazy var mainStack: UIStackView = {
            let stack          = UIStackView()
            stack.distribution = .fillProportionally
            stack.spacing      = 10
            stack.axis         = .vertical
            return stack
        }()
        
        
        // Перебор всех кнопок
        for (index, item) in buttons.enumerated() {
            
            //Создание горизонтального UIStackView
            lazy var stack: UIStackView = {
                let stack          = UIStackView()
                stack.distribution = .fillProportionally
                stack.spacing      = 10
                stack.axis         = .horizontal
                return stack
            }()
            
            //Добавление UIStackView в массив
            stacks.append(stack)

            //Добавление констрейнтов для кнопок
            for (i, button) in item.enumerated() {
                stack.addArrangedSubview(button)
                if index == 0 {
                    button.snp.makeConstraints { make in
                        if i != 0 {
                            make.width.equalTo(buttons[0][0].snp.width)
                        }
                        make.height.equalTo(buttons[0][0].snp.width)
                    }
                } else {
                    button.snp.makeConstraints { make in
                        make.height.equalTo(button.snp.width)
                    }
                }
            }
        }
        
        for stack in stacks.reversed() {
            mainStack.addArrangedSubview(stack)
        }
        
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
    }
    
}

extension ViewController: ButtonDelegate {
    func returnedValue(value: String) {
        CalculatorProperties.shared.clickButtonHandler(withTag: value)
        self.label.text = CalculatorProperties.shared.resultText
    }
}

