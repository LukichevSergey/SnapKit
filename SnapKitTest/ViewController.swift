//
//  ViewController.swift
//  SnapKitTest
//
//  Created by Сергей Лукичев on 11.11.2021.
//

import UIKit
import SnapKit

class ViewController: UIViewController {

    let button  = Button(title: "0", color: .darkGray, textAlignment: .left).settingButton()
    let button2 = Button(title: ",", color: .darkGray, textAlignment: .left).settingButton()
    let button3 = Button(title: "=", color: .darkGray, textAlignment: .left).settingButton()
    
    lazy var stack: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: [button, button2, button3])
        stack.distribution = .fill
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()
    
    let button5 = Button(title: "1", color: .darkGray, textAlignment: .center).settingButton()
    let button6 = Button(title: "2", color: .darkGray, textAlignment: .center).settingButton()
    let button7 = Button(title: "3", color: .darkGray, textAlignment: .center).settingButton()
    let button8 = Button(title: "+", color: .orange, textAlignment: .center).settingButton()

    lazy var stack2: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: [button5, button6, button7, button8])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()
    
    let button9  = Button(title: "4", color: .darkGray, textAlignment: .center).settingButton()
    let button10 = Button(title: "5", color: .darkGray, textAlignment: .center).settingButton()
    let button11 = Button(title: "6", color: .darkGray, textAlignment: .center).settingButton()
    let button12 = Button(title: "-", color: .orange, textAlignment: .center).settingButton()
    
    lazy var stack3: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: [button9, button10, button11, button12])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()
    
    let button13 = Button(title: "7", color: .darkGray, textAlignment: .center).settingButton()
    let button14 = Button(title: "8", color: .darkGray, textAlignment: .center).settingButton()
    let button15 = Button(title: "9", color: .darkGray, textAlignment: .center).settingButton()
    let button16 = Button(title: "*", color: .orange, textAlignment: .center).settingButton()
    
    lazy var stack4: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: [button13, button14, button15, button16])
        stack.distribution = .fillProportionally
        stack.spacing      = 10
        stack.axis         = .horizontal
        return stack
    }()
    
    let button17 = Button(title: "AC", color: .lightGray, textAlignment: .center).settingButton()
    let button18 = Button(title: "+/-", color: .lightGray, textAlignment: .center).settingButton()
    let button19 = Button(title: "%", color: .lightGray, textAlignment: .center).settingButton()
    let button20 = Button(title: "/", color: .orange, textAlignment: .center).settingButton()
    
    lazy var stack5: UIStackView = {
        let stack          = UIStackView(arrangedSubviews: [button17, button18, button19, button20])
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

        stack.addSubview(button)
        button.snp.makeConstraints { make in
            make.height.equalTo(self.button5.snp.width)
        }
        
        stack.addSubview(button2)
        button2.snp.makeConstraints { make in
            make.height.equalTo(self.button5.snp.width)
            make.width.equalTo(self.button2.snp.height)
        }
        
        stack.addSubview(button3)
        button3.snp.makeConstraints { make in
            make.height.equalTo(self.button5.snp.width)
            make.width.equalTo(self.button3.snp.height)
        }
        
        stack2.addSubview(button5)
        button5.snp.makeConstraints { make in
            make.height.equalTo(self.button5.snp.width)
        }
        
        stack2.addSubview(button6)
        button6.snp.makeConstraints { make in
            make.height.equalTo(self.button6.snp.width)
        }
        
        stack2.addSubview(button7)
        button7.snp.makeConstraints { make in
            make.height.equalTo(self.button7.snp.width)
        }
        
        stack2.addSubview(button8)
        button8.snp.makeConstraints { make in
            make.height.equalTo(self.button8.snp.width)
        }
        
        stack3.addSubview(button9)
        button9.snp.makeConstraints { make in
            make.height.equalTo(self.button9.snp.width)
        }
        
        stack3.addSubview(button10)
        button10.snp.makeConstraints { make in
            make.height.equalTo(self.button10.snp.width)
        }
        
        stack3.addSubview(button11)
        button11.snp.makeConstraints { make in
            make.height.equalTo(self.button11.snp.width)
        }
        
        stack3.addSubview(button12)
        button12.snp.makeConstraints { make in
            make.height.equalTo(self.button12.snp.width)
        }
        
        stack4.addSubview(button13)
        button13.snp.makeConstraints { make in
            make.height.equalTo(self.button13.snp.width)
        }
        
        stack4.addSubview(button14)
        button14.snp.makeConstraints { make in
            make.height.equalTo(self.button14.snp.width)
        }
        
        stack4.addSubview(button15)
        button15.snp.makeConstraints { make in
            make.height.equalTo(self.button15.snp.width)
        }
        
        stack4.addSubview(button16)
        button16.snp.makeConstraints { make in
            make.height.equalTo(self.button16.snp.width)
        }
        
        stack5.addSubview(button17)
        button17.snp.makeConstraints { make in
            make.height.equalTo(self.button17.snp.width)
        }
        
        stack5.addSubview(button18)
        button18.snp.makeConstraints { make in
            make.height.equalTo(self.button18.snp.width)
        }
        
        stack5.addSubview(button19)
        button19.snp.makeConstraints { make in
            make.height.equalTo(self.button19.snp.width)
        }
        
        stack5.addSubview(button20)
        button20.snp.makeConstraints { make in
            make.height.equalTo(self.button20.snp.width)
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
        print(value)
    }
}

