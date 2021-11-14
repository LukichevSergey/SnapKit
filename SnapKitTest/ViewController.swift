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

    lazy var stack: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: buttons[0])
        stack.distribution = .fill
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()
    
    lazy var stack2: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: buttons[1])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()

    lazy var stack3: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: buttons[2])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()


    lazy var stack4: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: buttons[3])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()

    lazy var stack5: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: buttons[4])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()


    lazy var mainStack: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: [stack5, stack4, stack3, stack2, stack])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .vertical
        return stack
    }()

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
        

        
        for item in buttons[1] {
            stack2.addSubview(item)
            item.snp.makeConstraints { make in
                make.height.equalTo(item.snp.width)
            }
        }
        
        
        for (index, item) in buttons[0].enumerated() {
            stack.addSubview(item)
            item.snp.makeConstraints { make in
                if index != 0 {
                    make.width.equalTo(buttons[0][0].snp.width)
                }
                make.height.equalTo(buttons[0][0].snp.width)
            }
        }
        
        for item in buttons[2] {
            stack3.addSubview(item)
            item.snp.makeConstraints { make in
                make.height.equalTo(item.snp.width)
            }
        }
        
        for item in buttons[3] {
            stack4.addSubview(item)
            item.snp.makeConstraints { make in
                make.height.equalTo(item.snp.width)
            }
        }
        
        for item in buttons[4] {
            stack5.addSubview(item)
            item.snp.makeConstraints { make in
                make.height.equalTo(item.snp.width)
            }
        }

        


        self.view.addSubview(mainStack)
        mainStack.snp.makeConstraints { make in
            make.right.left.equalTo(self.view).inset(10)
            make.centerX.equalTo(self.view)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom).inset(20)
        }

        mainStack.addSubview(stack)
        stack.snp.makeConstraints { make in
            make.right.left.equalTo(mainStack)
            make.centerX.equalTo(mainStack)
            make.bottom.equalTo(mainStack.snp.bottom)
        }

        mainStack.addSubview(stack2)
        stack2.snp.makeConstraints { make in
            make.right.left.equalTo(mainStack)
            make.centerX.equalTo(mainStack)
        }

        mainStack.addSubview(stack3)
        stack3.snp.makeConstraints { make in
            make.right.left.equalTo(mainStack)
            make.centerX.equalTo(mainStack)
        }

        mainStack.addSubview(stack4)
        stack4.snp.makeConstraints { make in
            make.right.left.equalTo(mainStack)
            make.centerX.equalTo(mainStack)
        }

        mainStack.addSubview(stack5)
        stack5.snp.makeConstraints { make in
            make.right.left.equalTo(mainStack)
            make.centerX.equalTo(mainStack)
        }
        
        

//        stack.addSubview(button)
//        button.snp.makeConstraints { make in
//            make.height.equalTo(buttons[buttons.count - 1][buttons.count - 1].snp.width)
//        }
//
//        stack.addSubview(button2)
//        button2.snp.makeConstraints { make in
//            make.height.equalTo(buttons[buttons.count - 1][buttons.count - 1].snp.width)
//            make.width.equalTo(buttons[buttons.count - 1][buttons.count - 1].snp.width)
//        }
//
//        stack.addSubview(button3)
//        button3.snp.makeConstraints { make in
//            make.height.equalTo(buttons[buttons.count - 1][buttons.count - 1].snp.width)
//            make.width.equalTo(buttons[buttons.count - 1][buttons.count - 1].snp.width)
//        }
        
        
        
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
        if self.label.text! == "0" {
            self.label.text! = String(value)
        } else {
            self.label.text! += String(value)
        }
    }
}

